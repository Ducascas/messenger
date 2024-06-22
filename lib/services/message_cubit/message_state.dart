part of 'message_cubit.dart';


  abstract class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
  }

  class MessageInitial extends MessageState {}

  class MessageSent extends MessageState {}

  class MessagesLoaded extends MessageState {
  final List<Message> messages;

  const MessagesLoaded(this.messages);

  @override
  List<Object> get props => [messages];
  }

  class MessageError extends MessageState {
  final String message;

  const MessageError(this.message);

  @override
  List<Object> get props => [message];
  }