part of 'chat_page_bloc.dart';

class ChatPageState extends Equatable {
  const ChatPageState();

  @override
  List<Object> get props => [];
}

class ChatPageInitial extends ChatPageState {}

class ChatListGetting extends ChatPageState {}

class ChatListGot extends ChatPageState {
  final List<ChatModel> chats;
  const ChatListGot({required this.chats});
}

class ChatListGetError extends ChatPageState {}

class ChatDeleting extends ChatPageState {}

class ChatDeleted extends ChatPageState {}

class ChatDeleteError extends ChatPageState {}
