import 'package:chat_app/models/models.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UserTile(
          user: widget.user,
        ),
        titleSpacing: 0.0,
        leading: Icon(Icons.arrow_back_ios_new),
      ),
    );
  }
}
