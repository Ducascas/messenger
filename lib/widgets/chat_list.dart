import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.receiverUser,
  });

  final User receiverUser;

  // @override
  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<LoginCubit>().state.user;

    return StreamBuilder<List<Message>>(
      stream: FirebaseService.getMessages(currentUser.id, receiverUser.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data ?? [];
          return ListView.separated(
            reverse: true,
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            itemCount: messages.length,
            separatorBuilder: (context, _) => const SizedBox(height: 20),
            itemBuilder: (context, index) {
              final message = messages[index];
              final isCurrentUser = message.senderId == currentUser.id;

              return Column(
                crossAxisAlignment: isCurrentUser
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  MessageTile(
                    content: message.content,
                    timestamp: message.timestamp,
                    isCurrentUser: isCurrentUser,
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
