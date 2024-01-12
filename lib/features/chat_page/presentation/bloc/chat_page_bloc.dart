import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/chat_page/data/models/chat_model.dart';
import 'package:goflex/features/chat_page/data/repositories/chat_repository.dart';

part 'chat_page_event.dart';
part 'chat_page_state.dart';

class ChatPageBloc extends Bloc<ChatPageEvent, ChatPageState> {
  ChatRepository repo;
  ChatPageBloc({
    required this.repo,
    required ChatPageState chatPageState,
  }) : super(ChatPageInitial()) {
    on<GetAllChats>(
      (event, emit) async {
        emit(ChatListGetting());
        try {
          List<ChatModel> res = await repo.getChatList();
          emit(ChatListGot(chats: res));
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(ChatListGetError());
        }
      },
    );
    on<DeleteChat>(
      (event, emit) async {
        emit(ChatDeleting());
        try {
          int res = await repo.deleteChat(event.chatId);
          if (res == 204) {
            emit(ChatDeleted());
          } else {
            emit(ChatDeleteError());
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(ChatDeleteError());
        }
      },
    );
  }
}
