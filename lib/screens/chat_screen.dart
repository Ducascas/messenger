import 'package:chat_app/models/models.dart';
import 'package:chat_app/screens/screens.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.receiverUser,
  });

  final User receiverUser;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.75;
    return Scaffold(
        appBar: AppBar(
          title: UserTile(
            user: receiverUser,
            showStatus: true,
          ),
          titleSpacing: 0.0,
          leading: _leadingAppBar(context),
        ),
        body: ListView(
          children: [
            const DividerCustom(),
            SizedBox(
              height: height,
              child: ChatList(receiverUser: receiverUser),
            ),
            const DividerCustom(),
            MessageSendBar(receiverUser: receiverUser),
          ],
        ));
  }

  _leadingAppBar(BuildContext context) {
    return GestureDetector(
      child: const Icon(Icons.arrow_back_ios_new),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      ),
    );
  }
}
