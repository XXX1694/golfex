part of 'message_bloc.dart';

class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageInitial extends MessageState {}

class MessageGetting extends MessageState {}

class MessageGot extends MessageState {
  final List<MessageModel> messages;
  const MessageGot({required this.messages});
}

class MessageGetError extends MessageState {}
