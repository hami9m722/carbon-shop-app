// message.dart
class Message {
  final String senderName;
  final String senderAvatar;
  final String receiverName;
  final String receiverAvatar;
  final String? content;
  final List<String>? imageUrls;
  final String? videoUrl;
  final String? audioUrl;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.senderName,
    required this.senderAvatar,
    required this.receiverName,
    required this.receiverAvatar,
    this.content,
    this.imageUrls,
    this.videoUrl,
    this.audioUrl,
    required this.timestamp,
    required this.isRead,
  });
}
