import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.receiverUser,
  });

  final User receiverUser;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.75;

    return Container(
      height: height,
      // child: StreamBuilder<List<User>>(
      // stream: FirebaseService.getUsers(),
      // builder: (context, snapshot) {
      //   if (snapshot.hasData) {
      //     final users = snapshot.data ?? [];
      //   }
      // },
      // ),
    );
  }
}
// StreamBuilder<List<User>>
// (
// stream: context.read<UserCubit>().firebaseService.getUsers(currentUser),
// builder: (context, snapshot) {
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Center(child: CircularProgressIndicator());
// }
// if (!snapshot.hasData || snapshot.data!.isEmpty) {
// return Center(child: Text('No users found'));
// }
// final users = snapshot.data!;
// return ListView.builder(
// itemCount: users.length,
// itemBuilder: (context, index) {
// final user = users[index];
// return ListTile(
// title: Text('${user.name} ${user.surname}'),
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => BlocProvider(
// create: (context) => MessageCubit(context.read<UserCubit>().firebaseService),
// child: ChatPage(currentUser: currentUser, contact: user),
// ),
// ),
// );
// },
// );
