import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thông Báo Facebook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(notification.avatarUrl),
          radius: 30,
        ),
        title: Text(notification.title),
        subtitle: Text(notification.subtitle),
        trailing: IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () {
            // Xử lý hành động tại đây (ví dụ: xem thêm chi tiết)
          },
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String subtitle;
  final String avatarUrl;
  final String timeAgo;

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.avatarUrl,
    required this.timeAgo,
  });
}

// Dữ liệu giả cho các thông báo
final List<NotificationItem> notifications = [
  NotificationItem(
    title: 'Bạn có một lời mời kết bạn mới',
    subtitle: 'John Doe đã gửi lời mời kết bạn.',
    avatarUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
    timeAgo: '1 giờ trước',
  ),
  NotificationItem(
    title: 'Bạn đã nhận được lời mời tham gia nhóm',
    subtitle: 'Group ABC mời bạn tham gia.',
    avatarUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
    timeAgo: '3 giờ trước',
  ),
  NotificationItem(
    title: 'Bạn đã được tag trong một bài viết',
    subtitle: 'Jane Doe đã gắn thẻ bạn trong bài viết.',
    avatarUrl: 'https://randomuser.me/api/portraits/women/1.jpg',
    timeAgo: '5 giờ trước',
  ),
  NotificationItem(
    title: 'Một người bạn đã cập nhật trạng thái của họ',
    subtitle: 'Alice đã chia sẻ một bài viết mới.',
    avatarUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
    timeAgo: '1 ngày trước',
  ),
  // Thêm nhiều thông báo ở đây nếu cần
];
