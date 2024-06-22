import 'package:chat_app/core/core.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
    required this.receiverUser,
  });

  final User receiverUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: UserTile(
            user: receiverUser,
          ),
          titleSpacing: 0.0,
          leading: _leadingAppBar(context),
        ),
        body: ListView(
          children: [
            const DividerCustom(),
            ChatList(
              receiverUser: receiverUser,
            ),
            const DividerCustom(),
            _rowMessage(context),
          ],
        ));
  }

  _rowMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCustom(
              controller: context.read<MessageCubit>().messageController,
              labelText: AppText.message,
              obscureText: false,
              onFieldSubmitted: (value) {
                print('11 $value');
              },
            ),
          ),
        ],
      ),
    );
  }

  _leadingAppBar(BuildContext context) {
    return GestureDetector(
      child: const Icon(Icons.arrow_back_ios_new),
      onTap: () => Navigator.pop(context),
    );
  }
}
