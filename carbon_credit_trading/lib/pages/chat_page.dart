import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:carbon_credit_trading/services/utils.dart';
import 'package:carbon_credit_trading/widgets/audio_recorder_button.dart';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/add_video_button.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:voice_message_package/voice_message_package.dart';

final List<Message> mockMessages = [
  Message(
    senderName: 'John Doe',
    senderAvatar: 'https://example.com/avatar1.jpg',
    receiverName: 'You',
    receiverAvatar: 'https://example.com/your_avatar.jpg',
    content: 'Hey, how are you?',
    timestamp: DateTime.parse('2024-10-15 10:31:00'),
    isRead: true,
  ),
  Message(
    senderName: 'You',
    senderAvatar: 'https://example.com/your_avatar.jpg',
    receiverName: 'John Doe',
    receiverAvatar: 'https://example.com/avatar1.jpg',
    content: 'I\'m fine, thanks!',
    timestamp: DateTime.parse('2024-10-20 10:32:00'),
    isRead: true,
  ),
];

class ChatPage extends StatefulWidget {
  final String contactName;
  final String contactAvatar;

  const ChatPage({
    super.key,
    required this.contactName,
    required this.contactAvatar,
  });

  @override
  createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  bool _isSendButtonVisible = false;
  bool _isOptionsVisible = false;
  Message? _replyMessage;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkText);
  }

  void _checkText() {
    setState(() {
      _isSendButtonVisible = _controller.text.isNotEmpty;
    });
  }

  void _sendTextMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        mockMessages.add(
          Message(
            senderName: 'You',
            senderAvatar: 'https://example.com/your_avatar.jpg',
            receiverName: widget.contactName,
            receiverAvatar: widget.contactAvatar,
            content: _controller.text,
            replyTo: _replyMessage,
            timestamp: DateTime.now(),
            isRead: true,
          ),
        );
        _controller.clear();
        _replyMessage = null;
      });
    }
  }

  Future<void> _sendMediaMessage({
    List<String>? imageUrls,
    String? videoUrl,
    String? audioUrl,
    Message? replyMessage,
  }) async {
    if (audioUrl != null) {
      final audioDuration = await _getAudioDuration(audioUrl);
      if (audioDuration.inSeconds > 0 && audioDuration.inSeconds < 60) {
        setState(() {
          mockMessages.add(
            Message(
                senderName: 'You',
                senderAvatar: 'https://example.com/your_avatar.jpg',
                receiverName: widget.contactName,
                receiverAvatar: widget.contactAvatar,
                audioUrl: audioUrl,
                timestamp: DateTime.now(),
                isRead: true,
                replyTo: replyMessage),
          );
        });
      } else {
        showErrorDialog(
            'Thời gian ghi âm phải lớn hơn 0 giây và nhỏ hơn 60 giây.');
      }
    } else {
      setState(() {
        mockMessages.add(
          Message(
              senderName: 'You',
              senderAvatar: 'https://example.com/your_avatar.jpg',
              receiverName: widget.contactName,
              receiverAvatar: widget.contactAvatar,
              imageUrls: imageUrls,
              videoUrl: videoUrl,
              timestamp: DateTime.now(),
              isRead: true,
              replyTo: replyMessage),
        );
      });
    }
  }

  void _toggleOptions() {
    setState(() {
      _isOptionsVisible = !_isOptionsVisible;
      FocusScope.of(context).unfocus();
    });
  }

  void onImageSelected(File image) {
    _sendMediaMessage(imageUrls: [image.path]);
  }

  void onVideoSelected(File video) {
    _sendMediaMessage(videoUrl: video.path);
  }

  Future<Duration> _getAudioDuration(String audioUrl) async {
    final AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.setSourceUrl(audioUrl);
    final Duration? duration = await audioPlayer.getDuration();
    return duration!;
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_checkText);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.contactAvatar),
                radius: 18,
              ),
              const SizedBox(width: 10),
              Text(widget.contactName),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: groupMessagesByDate(mockMessages).length,
                itemBuilder: (context, index) {
                  final groupedMessages = groupMessagesByDate(mockMessages);

                  final dates = groupedMessages.keys.toList().reversed.toList();

                  final date = dates.elementAt(index);

                  final messages = groupedMessages[date]!;

                  final unreadMessages = messages
                      .where((msg) => !msg.isRead && msg.receiverName == 'You')
                      .toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          !isToday(date) ? date : 'Hôm nay',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ),
                      ...messages.map((message) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: message.senderName == 'You'
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(children: [
                                      if (message.senderName != 'You')
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              message.senderAvatar),
                                        ),
                                      const SizedBox(width: 8),
                                      _buildMessageContent(message),
                                    ]),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        DateFormat('HH:mm').format(
                                            message.timestamp), // Display time
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),
            if (_replyMessage != null) _buildReply(_replyMessage!),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Row(
                    children: [
                      AnimatedRotation(
                        turns: _isOptionsVisible ? 0.5 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: IconButton(
                          icon: Icon(
                            _isOptionsVisible
                                ? Icons.cancel_outlined
                                : Icons.add_circle_outline_outlined,
                            size: 40,
                          ),
                          onPressed: _toggleOptions,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Gửi tin nhắn ...',
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      if (_isSendButtonVisible)
                        IconButton(
                          icon: const Icon(Icons.send,
                              color: AppColors.greenButton),
                          onPressed: _sendTextMessage,
                        ),
                    ],
                  ),
                  if (_isOptionsVisible)
                    Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ImagePickerButton(
                            onImageSelected: onImageSelected,
                            child:
                                _buildOptionItem(Icons.camera_alt, 'Chọn ảnh'),
                          ),
                          AddVideoButton(
                            picker: ImagePicker(),
                            showErrorDialog: showErrorDialog,
                            onVideoChanged: onVideoSelected,
                            child: _buildOptionItem(
                                Icons.video_call, 'Chọn video'),
                          ),
                          AudioRecorderButton(
                            onAudioRecorded: (audioPath) {
                              _sendMediaMessage(audioUrl: audioPath);
                            },
                          ),
                        ],
                      ),
                    ),
                ])),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _buildMessageContent(Message message) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxWidth = screenWidth * 0.55;

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      if (message.replyTo != null) ...[
        Text(
          message.replyTo!.senderName == 'You'
              ? 'Chính bạn'
              : message.replyTo!.senderName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          message.replyTo!.content!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.0), // Space between reply and current message
      ],
      // Display the main message content

      GestureDetector(
        onLongPress: () => _showMessageOptions(message),
        child: message.videoUrl != null
            ? Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    "Nhấp vào để xem",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : message.imageUrls != null && message.imageUrls!.isNotEmpty
                ? Column(
                    children: message.imageUrls!.map((url) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          File(url),
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      );
                    }).toList(),
                  )
                : message.audioUrl != null
                    ? FutureBuilder<Duration>(
                        future: _getAudioDuration(message.audioUrl!),
                        builder: (context, snapshot) {
                          final audioDuration =
                              snapshot.data ?? const Duration(seconds: 1);
                          return VoiceMessageView(
                            controller: VoiceController(
                              audioSrc: message.audioUrl!,
                              onComplete: () {},
                              onPause: () {},
                              onPlaying: () {},
                              onError: (err) {},
                              maxDuration: audioDuration,
                              isFile: true,
                            ),
                            innerPadding: 12,
                            cornerRadius: 20,
                          );
                        },
                      )
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        constraints: BoxConstraints(maxWidth: maxWidth),
                        decoration: BoxDecoration(
                          color: message.senderName == 'You'
                              ? Colors.blue
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          message.content ?? '',
                          style: TextStyle(
                            color: message.senderName == 'You'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
      )
    ]);
  }

  void _showMessageOptions(Message message) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (message.content != null) ...[
                ListTile(
                  leading: const Icon(Icons.reply),
                  title: const Text('Reply'),
                  onTap: () {
                    _replyToMessage(message);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: const Text('Copy'),
                  onTap: () {
                    // Handle copy action
                    Clipboard.setData(ClipboardData(text: message.content!));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: const Text('Chia sẻ'),
                  onTap: () {
                    // Handle copy action
                    String contentToShare = message.audioUrl ?? '';
                    Share.share(contentToShare);
                  },
                ),
              ],
              // Các tùy chọn khác như Download Image, Download Video, v.v.
              // ...
            ],
          ),
        );
      },
    );
  }

  void _replyToMessage(Message message) {
    setState(() {
      _replyMessage = message;
    });
  }

  void _sendReplyMessage(Message? originalReplyMessage, String replyContent) {
    Message replyMessage = Message(
      senderName: "Your Name",
      senderAvatar: "path/to/your/avatar.png",
      receiverName: "Receiver's Name",
      receiverAvatar: "path/to/receiver/avatar.png",
      content: replyContent,
      timestamp: DateTime.now(),
      replyTo: originalReplyMessage,
    );

    setState(() {
      mockMessages.add(replyMessage);
    });

    // Hiển thị thông báo gửi thành công
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Reply sent!")),
    );
  }

  Widget _buildReply(Message replyMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              replyMessage.senderName == 'You'
                  ? 'Chính bạn'
                  : replyMessage.senderName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              replyMessage.content!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
