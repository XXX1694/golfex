part of 'message_bloc.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();

  @override
  List<Object> get props => [];
}

class GetAllMessages extends MessageEvent {
  final int chatId;
  const GetAllMessages({required this.chatId});
}

class Reset extends MessageEvent {}
