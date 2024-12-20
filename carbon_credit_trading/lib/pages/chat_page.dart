import 'dart:async';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:carbon_credit_trading/api/api.dart';
import 'package:carbon_credit_trading/extensions/dto.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/services/service.dart';
import 'package:carbon_credit_trading/services/utils.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/add_video_button.dart';
import 'package:carbon_credit_trading/widgets/audio_recorder_button.dart';
import 'package:carbon_credit_trading/widgets/full_screen_view.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:uuid/uuid.dart';
import 'package:voice_message_package/voice_message_package.dart';

//

class ChatPage extends StatefulWidget {
  String? conversationId;
  final int chatWithUserId;
  final String chatWithUserName;
  final String chatWithUserAvatar;

  ChatPage(
      {super.key,
      required this.chatWithUserId,
      required this.chatWithUserName,
      required this.chatWithUserAvatar,
      this.conversationId});

  @override
  createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with WidgetsBindingObserver {
  final TextEditingController _controller = TextEditingController();
  final Uuid uuid = const Uuid();
  bool _isSendButtonVisible = false;
  bool _isOptionsVisible = false;
  Message? _replyMessage;
  final ScrollController _scrollController = ScrollController();
  final Map<int, GlobalKey> _messageKeys = {};
  final Set<int> loadedMessageIds = {};

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_checkText);

    _startPollingNewMessage();
    //_markMessageAsRead(); //if receiver == you
    //_setUserInChat(true);
  }

  void _startPollingNewMessage() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      await _pollingNewMessage();
    });
  }

  Future<void> _pollingNewMessage() async {
    try {
      if (widget.conversationId == null) {
        return;
      }
      var latestMessage =
          await userControllerApi.getLatestMessage(widget.conversationId!);
      if (latestMessage != null &&
          !loadedMessageIds.contains(latestMessage.id!)) {
        setState(() {
          loadedMessageIds.add(latestMessage.id!);
        });
      }
    } catch (e) {
      print('API error: $e');
    }
  }

  void _checkText() {
    setState(() {
      _isSendButtonVisible = _controller.text.isNotEmpty;
    });
  }

  Future<void> _sendTextMessage() async {
    if (_controller.text.isNotEmpty) {
      var dto = await userControllerApi.sendMessage(SendChatMessageDTO(
        content: _controller.text.trim(),
        receiver: widget.chatWithUserId,
      ));
      setState(() {
        widget.conversationId ??= dto?.conversationId;
        _controller.clear();
        _replyMessage = null;
      });
    }
  }

  Future<void> _sendMediaMessage({
    List<String>? imageUrls,
    String? videoUrl,
    String? audioUrl,
  }) async {
    if (audioUrl != null) {
      final audioDuration = await _getAudioDuration(audioUrl);
      if (audioDuration.inSeconds > 0 && audioDuration.inSeconds < 60) {
        setState(() {
          // mockMessages.add(
          //   Message(
          //       messageId: "msg${uuid.v4()}",
          //       senderName: 'You',
          //       senderAvatar: 'https://example.com/your_avatar.jpg',
          //       receiverName: widget.contactName,
          //       receiverAvatar: widget.contactAvatar,
          //       audioUrl: audioUrl,
          //       timestamp: DateTime.now(),
          //       isRead: false,
          //       replyTo: _replyMessage),
          // );
        });
      } else {
        showErrorDialog(
            'Thời gian ghi âm phải lớn hơn 0 giây và nhỏ hơn 60 giây.');
      }
    } else {
      setState(() {
        // mockMessages.add(
        //   Message(
        //       messageId: "msg${uuid.v4()}",
        //       senderName: 'You',
        //       senderAvatar: 'https://example.com/your_avatar.jpg',
        //       receiverName: widget.contactName,
        //       receiverAvatar: widget.contactAvatar,
        //       imageUrls: imageUrls,
        //       videoUrl: videoUrl,
        //       timestamp: DateTime.now(),
        //       isRead: false,
        //       replyTo: _replyMessage),
        // );
      });
    }
  }

  void _toggleOptions() {
    setState(() {
      _isOptionsVisible = !_isOptionsVisible;
      FocusScope.of(context).unfocus();
    });
  }

  void onImageselected(List<File> images) {
    List<String> imageUrls = images.map((image) => image.path).toList();

    _sendMediaMessage(imageUrls: imageUrls);
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

  void _scrollToOriginalMessage(int messageId) {
    final targetKey = _messageKeys[messageId];

    if (targetKey != null) {
      final context = targetKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.removeListener(_checkText);
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        onPopInvokedWithResult: (didPop, result) => {},
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.chatWithUserAvatar),
                    radius: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(widget.chatWithUserName),
                ],
              ),
            ),
            body: FutureBuilder<List<Message>>(future: () async {
              if (widget.conversationId == null) {
                return [] as List<Message>;
              }
              var conversationMessages = await userControllerApi
                  .getConversationMessages(widget.conversationId!);
              conversationMessages?.content.forEach((message) {
                loadedMessageIds.add(message.id!);
              });
              return await conversationMessages!.toMessages();
            }(), builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final conversationMessages = snapshot.data;
                return buildMessageList(conversationMessages!);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ));
  }

  Column buildMessageList(List<Message> conversationMessages) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ListView.builder(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: groupMessagesByDate(conversationMessages).length,
            itemBuilder: (context, index) {
              final groupedMessages = groupMessagesByDate(conversationMessages);

              final dates = groupedMessages.keys.toList().reversed.toList();

              final date = dates.elementAt(index);

              final messages = groupedMessages[date]!;

              final unreadMessages = messages
                  .where((msg) => !msg.isRead && msg.receiverName == 'You')
                  .toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Text(
                      !isToday(date) ? date : 'Hôm nay',
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ),
                  ...messages.map((message) {
                    final messageKey = GlobalKey();

                    _messageKeys[message.messageId] = messageKey;
                    return Container(
                      key: messageKey,
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
                                Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      if (message.senderName != 'You')
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              message.senderAvatar),
                                        ),
                                      const SizedBox(width: 8),
                                      _buildMessageContent(message),
                                    ]),
                                Row(children: [
                                  Text(
                                    DateFormat('HH:mm')
                                        .format(message.timestamp),
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 12),
                                  ),
                                  const SizedBox(width: 2),
                                  Icon(
                                    message.isRead
                                        ? Icons.done_all
                                        : Icons.done,
                                    color: message.isRead
                                        ? Colors.blue
                                        : Colors.grey,
                                  )
                                ]),
                              ]),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ),
        Column(children: [
          if (_replyMessage != null) _buildReply(_replyMessage!),
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
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (_isSendButtonVisible)
                IconButton(
                  icon: const Icon(Icons.send, color: AppColors.greenButton),
                  onPressed: _sendTextMessage,
                ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
          if (_isOptionsVisible)
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ImagePickerButton(
                    onImagesSelected: onImageselected,
                    child: _buildOptionItem(Icons.camera_alt, 'Chọn ảnh'),
                  ),
                  AddVideoButton(
                    picker: ImagePicker(),
                    showErrorDialog: showErrorDialog,
                    onVideoChanged: onVideoSelected,
                    child: _buildOptionItem(Icons.video_call, 'Chọn video'),
                  ),
                  AudioRecorderButton(
                    onAudioRecorded: (audioPath) {
                      _sendMediaMessage(audioUrl: audioPath);
                    },
                  ),
                ],
              ),
            ),
        ]),
      ],
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

    return Stack(
        clipBehavior: Clip.none,
        alignment: message.senderName == 'You'
            ? Alignment.topRight
            : Alignment.topLeft,
        children: [
          Positioned(
              child: message.replyTo != null
                  ? GestureDetector(
                      onTap: () =>
                          _scrollToOriginalMessage(message.replyTo!.messageId),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          constraints: BoxConstraints(maxWidth: maxWidth),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.replyTo!.senderName == 'You'
                                    ? 'Phản hồi lại chính bạn'
                                    : 'Phản hồi lại ${message.replyTo!.senderName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                message.replyTo!.videoUrl != null
                                    ? 'Video ${message.replyTo!.videoUrl}'
                                    : message.replyTo!.imageUrls != null &&
                                            message
                                                .replyTo!.imageUrls!.isNotEmpty
                                        ? 'Ảnh: ${message.replyTo!.imageUrls!.join(", ")}'
                                        : message.replyTo!.audioUrl != null
                                            ? 'Audio: ${message.replyTo!.audioUrl}'
                                            : message.replyTo!.content!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          )),
                    )
                  : const SizedBox()),
          Container(
            margin: EdgeInsets.only(top: message.replyTo != null ? 75 : 0),
            child: message.videoUrl != null
                ? GestureDetector(
                    onLongPress: () => _showMessageOptions(message),
                    onTap: () {
                      showFullScreen(context, [message.videoUrl!], 0);
                    },
                    child: Container(
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
                    ))
                : message.imageUrls != null && message.imageUrls!.isNotEmpty
                    ? GestureDetector(
                        onLongPress: () => _showMessageOptions(message),
                        child: Column(
                          children:
                              message.imageUrls!.asMap().entries.map((entry) {
                            int index = entry.key;
                            String url = entry.value;

                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    showFullScreen(
                                        context, message.imageUrls!, index);
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.file(
                                      File(url),
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 200,
                                    ),
                                  ),
                                ),
                                if (index < message.imageUrls!.length - 1)
                                  const SizedBox(height: 5),
                              ],
                            );
                          }).toList(),
                        ),
                      )
                    : message.audioUrl != null
                        ? GestureDetector(
                            onLongPress: () => _showMessageOptions(message),
                            child: FutureBuilder<Duration>(
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
                                  circlesColor: Colors.blue,
                                  activeSliderColor: Colors.blue,
                                  size: 38,
                                );
                              },
                            ))
                        : GestureDetector(
                            onLongPress: () => _showMessageOptions(message),
                            child: Container(
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
                            )),
          )
        ]);
  }

  void _showMessageOptions(Message message) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  _replyToMessage(message);
                  Navigator.pop(context);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.reply, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Reply'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (message.content != null && message.content!.isNotEmpty) {
                    Clipboard.setData(ClipboardData(text: message.content!));
                  } else if (message.videoUrl != null) {
                    Clipboard.setData(ClipboardData(text: message.videoUrl!));
                  } else if (message.imageUrls != null &&
                      message.imageUrls!.isNotEmpty) {
                    String combinedUrls = message.imageUrls!.join('\n');
                    Clipboard.setData(ClipboardData(text: combinedUrls));
                  } else if (message.audioUrl != null) {
                    Clipboard.setData(ClipboardData(text: message.audioUrl!));
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.copy, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Copy'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (message.content != null && message.content!.isNotEmpty) {
                    Share.share(message.content!);
                  } else if (message.videoUrl != null) {
                    Share.share(message.videoUrl!);
                  } else if (message.imageUrls != null &&
                      message.imageUrls!.isNotEmpty) {
                    String combinedUrls = message.imageUrls!.join('\n');
                    Share.share(combinedUrls);
                  } else if (message.audioUrl != null) {
                    Share.share(message.audioUrl!);
                  }
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.share, color: AppColors.greenButton),
                    SizedBox(height: 4),
                    Text('Chia sẻ'),
                  ],
                ),
              ),
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

  Widget _buildReply(Message replyMessage) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 5),
      width: double.infinity,
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  replyMessage.senderName == 'You'
                      ? 'Phản hồi chính bạn'
                      : 'Phản hồi lại ${replyMessage.senderName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  replyMessage.content != null &&
                          replyMessage.content!.isNotEmpty
                      ? replyMessage.content!
                      : replyMessage.videoUrl != null
                          ? replyMessage.videoUrl!
                          : replyMessage.imageUrls != null &&
                                  replyMessage.imageUrls!.isNotEmpty
                              ? replyMessage.imageUrls!.join('\n')
                              : replyMessage.audioUrl ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              setState(() {
                _replyMessage = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
