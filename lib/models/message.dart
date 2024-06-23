import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final String? fileUrl;
  final Timestamp timestamp;

  Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    this.fileUrl,
    required this.timestamp,
  });

  Message copyWith(
      {String? senderId,
      String? receiverId,
      String? content,
      String? fileUrl,
      Timestamp? timestamp}) {
    return Message(
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      fileUrl: fileUrl ?? this.fileUrl,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
