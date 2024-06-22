import 'package:chat_app/models/models.dart';
import 'package:chat_app/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  final messageController = TextEditingController();

  void dispose() {
    messageController.dispose();
  }

  void sendMessage(User currentUser, User receiverUser) async {
    try {
      if (messageController.text.isNotEmpty) {
        final message = Message(
          senderId: currentUser.id,
          receiverId: receiverUser.id,
          content: messageController.text,
          timestamp: DateTime.now(),
        );

        await FirebaseService.saveMessage(message);

        messageController.clear();

        emit(MessageSent());
      }
    } catch (e) {
      emit(MessageError('Ошибка отправки сообщения: $e'));
    }
  }

  void loadMessages(String senderId, String receiverId) {
    FirebaseService.getMessages(senderId, receiverId).listen((messages) {
      emit(MessagesLoaded(messages));
    });
  }
}
