import 'package:chat_app/core/core.dart';
import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:chat_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageSendBar extends StatefulWidget {
  const MessageSendBar({super.key, required this.receiverUser});

  final User receiverUser;

  @override
  State<MessageSendBar> createState() => _MessageSendBarState();
}

class _MessageSendBarState extends State<MessageSendBar> {
  @override
  void dispose() {
    context.read<MessageCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageCubit = context.read<MessageCubit>();
    final currentUser = context.read<LoginCubit>().state.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFieldCustom(
              controller: messageCubit.messageController,
              labelText: AppText.message,
              obscureText: false,
              onFieldSubmitted: (value) {
                messageCubit.sendMessage(currentUser, widget.receiverUser);
              },
            ),
          ),
        ],
      ),
    );
  }
}
