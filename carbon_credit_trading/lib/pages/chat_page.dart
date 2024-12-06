// chat_screen.dart

import 'package:carbon_credit_trading/models/message.dart';
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
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
          Expanded(
            child: ListView.builder(
              itemCount: mockMessages.length,
              itemBuilder: (context, index) {
                final message = mockMessages[index];
                final isSender = message.senderName == 'You';
                return Container(
                  margin: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
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
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
