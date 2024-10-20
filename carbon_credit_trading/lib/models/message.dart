class Message {
  final String senderName;
  final String senderAvatar;
  final String receiverName;
  final String receiverAvatar;
  final String content;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.senderName,
    required this.senderAvatar,
    required this.receiverName,
    required this.receiverAvatar,
    required this.content,
    required this.timestamp,
    required this.isRead,
  });
}
