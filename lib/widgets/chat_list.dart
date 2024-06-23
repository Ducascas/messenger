import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
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
          return ListView.builder(
            reverse: true,
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return ListTile(
                title: Text(message.content),
                // subtitle: Text(message.timestamp.toString()),
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
