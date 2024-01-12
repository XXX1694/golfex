part of 'chat_page_bloc.dart';

abstract class ChatPageEvent extends Equatable {
  const ChatPageEvent();

  @override
  List<Object> get props => [];
}

class GetAllChats extends ChatPageEvent {}

class DeleteChat extends ChatPageEvent {
  final int chatId;
  const DeleteChat({required this.chatId});
}
