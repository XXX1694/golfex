import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/message/data/models/message_model.dart';
import 'package:goflex/features/message/data/repositories/message_repository.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageRepository repo;

  MessageBloc({
    required this.repo,
    required MessageState messageState,
  }) : super(MessageInitial()) {
    on<GetAllMessages>(
      (event, emit) async {
        emit(MessageGetting());
        try {
          List<MessageModel> res = await repo.getChatInfo(event.chatId);

          emit(MessageGot(messages: res));
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(MessageGetError());
        }
      },
    );
    on<Reset>(
      (event, emit) => emit(MessageInitial()),
    );
  }
}
