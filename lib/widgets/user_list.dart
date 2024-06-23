import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<User>>(
      stream: FirebaseService.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final users = snapshot.data ?? [];
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: users.length,
            separatorBuilder: (context, _) => const DividerCustom(),
            itemBuilder: (context, index) {
              final receiverUser = users[index];
              return UserTile(
                user: receiverUser,
                onTap: () => _navigateToChat(context, receiverUser),
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

  _navigateToChat(BuildContext context, User receiverUser) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(receiverUser: receiverUser),
      ),
    );
  }
}
