import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_password/data/repositories/chnage_password_reository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepository repo;
  ChangePasswordBloc({
    required this.repo,
    required ChangePasswordState changePasswordState,
  }) : super(ChangePasswordInitial()) {
    on<ChangePassword>(
      (event, emit) async {
        emit(PasswordChanging());
        try {
          final res = await repo.changePassword(
            newPassword: event.newPassword,
            oldPassword: event.oldPassword,
          );
          if (res == 201) {
            emit(PasswordChanged());
          } else {
            emit(PasswordChangeError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(PasswordChangeError());
        }
      },
    );
  }
}
