import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/get_user_id/data/repositories/get_user_id_repo.dart';

part 'get_user_id_event.dart';
part 'get_user_id_state.dart';

class GetUserIdBloc extends Bloc<GetUserIdEvent, GetUserIdState> {
  GetUserIdRepo repo;
  GetUserIdBloc({
    required this.repo,
    required GetUserIdState getUserIdState,
  }) : super(GetUserIdInitial()) {
    on<GetUserIdEvent>(
      (event, emit) async {
        emit(GettingUserId());
        try {
          final res = await repo.getUserId();
          if (res != null) {
            emit(GotUserId(userId: res));
          } else {
            emit(GetUserIdError());
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error: $e');
          }
          emit(GetUserIdError());
        }
      },
    );
  }
}
