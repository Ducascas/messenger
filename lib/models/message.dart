class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final String? fileUrl;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    this.fileUrl,
    required this.timestamp,
  });
}
