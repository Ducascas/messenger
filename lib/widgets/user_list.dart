import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: _logIn,
      onInactive: _logOut,
      onHide: _logOut,
      onPause: _logOut,
      onRestart: _logOut,
      onDetach: _logOut,
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _logOut() => context.read<LoginCubit>().logOut();

  void _logIn() => context.read<LoginCubit>().logIn();

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<LoginCubit>().state.user;

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

              return StreamBuilder(
                stream: FirebaseService.getLastMessage(
                    currentUser.id, receiverUser.id),
                builder: (context, snapshot) {
                  final message = snapshot.data;
                  return UserTile(
                    user: receiverUser,
                    onTap: () => _navigateToChat(context, receiverUser),
                    message: message,
                    showStatus: false,
                  );
                },
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
