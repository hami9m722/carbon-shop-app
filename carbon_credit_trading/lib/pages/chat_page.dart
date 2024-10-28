import 'dart:io';
import 'package:flutter/material.dart';
import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:carbon_credit_trading/widgets/add_video_button.dart';
import 'package:carbon_credit_trading/widgets/image_picker_button.dart';
import 'package:image_picker/image_picker.dart';

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
            timestamp: DateTime.now(),
            isRead: true,
          ),
        );
        _controller.clear();
      });
    }
  }

  void _sendMediaMessage({List<String>? imageUrls, String? videoUrl}) {
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
        ),
      );
    });
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
                shrinkWrap: true,
                itemCount: mockMessages.length,
                itemBuilder: (context, index) {
                  final message = mockMessages[mockMessages.length - 1 - index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: message.senderName == 'You'
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (message.senderName != 'You')
                          CircleAvatar(
                            backgroundImage: NetworkImage(message.senderAvatar),
                          ),
                        const SizedBox(width: 8),
                        _buildMessageContent(message),
                      ],
                    ),
                  );
                },
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                )),
            if (_isOptionsVisible)
              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ImagePickerButton(
                      onImageSelected: onImageSelected,
                      child: _buildOptionItem(Icons.camera_alt, 'Chọn ảnh'),
                    ),
                    AddVideoButton(
                      picker: ImagePicker(),
                      showErrorDialog: showErrorDialog,
                      onVideoChanged: onVideoSelected,
                      child: _buildOptionItem(Icons.video_call, 'Chọn video'),
                    ),
                    _buildOptionItem(Icons.mic, 'Ghi âm'),
                  ],
                ),
              ),
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
    double maxWidth = screenWidth * 0.6;

    if (message.videoUrl != null) {
      return Container(
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
      );
    } else if (message.imageUrls != null && message.imageUrls!.isNotEmpty) {
      return Column(
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
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        constraints: BoxConstraints(maxWidth: maxWidth), // Limit width to 60%
        decoration: BoxDecoration(
          color: message.senderName == 'You' ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          message.content ?? '',
          style: TextStyle(
            color: message.senderName == 'You' ? Colors.white : Colors.black,
          ),
        ),
      );
    }
  }
}
