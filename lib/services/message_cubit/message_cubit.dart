import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit()
      : super(
          MessageState(
            message: Message(
              senderId: '',
              receiverId: '',
              content: '',
              timestamp: Timestamp.now(),
            ),
          ),
        );

  final messageController = TextEditingController();

  void dispose() {
    messageController.dispose();
  }

  void sendMessage(User currentUser, User receiverUser) async {
    final content = messageController.text.trim();

    if (messageController.text.isNotEmpty) {
      final message = state.message.copyWith(
        senderId: currentUser.id,
        receiverId: receiverUser.id,
        content: content,
        fileUrl: '',
        timestamp: Timestamp.now(),
      );

      FirebaseService.saveMessage(message);

      messageController.clear();

      emit(state.copyWith(message: message));
    }
  }
}
