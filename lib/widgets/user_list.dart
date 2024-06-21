import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/services/firebase_service.dart';
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
              final user = users[index];
              return UserTile(
                user: user,
                onTap: () => _navigateToChat(context, user),
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

  _navigateToChat(BuildContext context, User user) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatScreen(user: user),
      ),
    );
  }
}
