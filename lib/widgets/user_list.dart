import 'package:chat_app/models/models.dart';
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        }
        final users = snapshot.data ?? [];
        return ListView.separated(
          itemCount: users.length,
          separatorBuilder: (context, _) => const DividerCustom(),
          itemBuilder: (context, index) {
            final user = users[index];
            return UserTile(
              name: user.name,
              surName: user.surname,
            );
          },
        );
      },
    );
  }
}
