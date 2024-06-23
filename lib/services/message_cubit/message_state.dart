part of 'message_cubit.dart';

class MessageState {
  final Message message;

  MessageState({
    required this.message,
  });

  MessageState copyWith({Message? message}) {
    return MessageState(
      message: message ?? this.message,
    );
  }
}
