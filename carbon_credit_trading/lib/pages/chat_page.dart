import 'package:carbon_credit_trading/models/message.dart';
import 'package:carbon_credit_trading/theme/colors.dart';
import 'package:flutter/material.dart';

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

  void _sendMessage() {
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
        _isSendButtonVisible = false;
      });
    }
  }

  void _toggleOptions() {
    setState(() {
      _isOptionsVisible = !_isOptionsVisible;
      FocusScope.of(context).unfocus();
    });
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
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: mockMessages.length,
                itemBuilder: (context, index) {
                  final message = mockMessages[mockMessages.length - 1 - index];
                  final isSender = message.senderName == 'You';
                  return Container(
                    margin: EdgeInsets.only(
                      top: 3,
                      bottom: 3,
                      left: isSender ? 50 : 8,
                      right: isSender ? 8 : 50,
                    ),
                    child: Row(
                      mainAxisAlignment: isSender
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isSender)
                          CircleAvatar(
                            backgroundImage: NetworkImage(message.senderAvatar),
                          ),
                        const SizedBox(width: 8),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            decoration: BoxDecoration(
                              color: isSender ? Colors.blue : Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              message.content,
                              style: TextStyle(
                                color: isSender ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  AnimatedRotation(
                    turns: _isOptionsVisible ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                      padding: EdgeInsets.zero,
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
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 150,
                      ),
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
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_isSendButtonVisible)
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.greenButton,
                      ),
                      onPressed: _sendMessage,
                    ),
                ],
              ),
            ),
            if (_isOptionsVisible)
              AnimatedSlide(
                  offset: _isOptionsVisible ? Offset.zero : const Offset(0, 1),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                      opacity: _isOptionsVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        color: Colors.grey[200],
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildOptionItem(Icons.image, 'Thư viện'),
                            _buildOptionItem(Icons.camera_alt, 'Máy ảnh'),
                            _buildOptionItem(Icons.video_call, 'Máy quay'),
                            _buildOptionItem(Icons.mic, 'Ghi âm'),
                          ],
                        ),
                      ))),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 30),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
