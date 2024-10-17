import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Hành động khi bấm nút tìm kiếm
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Hành động khi bấm nút thêm cuộc trò chuyện
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chatData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(chatData[index]['avatarUrl']),
            ),
            title: Text(
              chatData[index]['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(chatData[index]['message']),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  chatData[index]['time'],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                if (chatData[index]['unreadCount'] > 0)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Text(
                      chatData[index]['unreadCount'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              // Điều hướng tới màn hình chat cụ thể
            },
          );
        },
      ),
    );
  }
}

final List<Map<String, dynamic>> chatData = [
  {
    'name': 'John Doe',
    'message': 'Hey, how are you?',
    'time': '15:30',
    'unreadCount': 2,
    'avatarUrl': 'https://example.com/avatar1.jpg',
  },
  {
    'name': 'Jane Smith',
    'message': 'Let\'s catch up later!',
    'time': '14:45',
    'unreadCount': 0,
    'avatarUrl': 'https://example.com/avatar2.jpg',
  },
  {
    'name': 'Mike Johnson',
    'message': 'Meeting at 4 PM, don\'t forget.',
    'time': '13:20',
    'unreadCount': 1,
    'avatarUrl': 'https://example.com/avatar3.jpg',
  },
];