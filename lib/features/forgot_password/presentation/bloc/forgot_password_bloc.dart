import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/forgot_password/data/repositories/forgot_password_repo.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordRepository repo;
  ForgotPasswordBloc({
    required this.repo,
    required ForgotPasswordState forgotPasswordState,
  }) : super(ForgotPasswordInitial()) {
    on<SendCode>(
      (event, emit) async {
        try {
          emit(CodeSending());
          final res = await repo.sendCode(email: event.email);
          if (res == 201) {
            emit(CodeSended());
          } else {
            emit(CodeSendError());
          }
        } catch (e) {
          emit(CodeSendError());
        }
      },
    );
    on<CreatePassword>(
      (event, emit) async {
        try {
          emit(ResetingPassword());
          final res = await repo.createPassword(
            email: event.email,
            code: event.code,
            password: event.password,
          );
          if (res == 201) {
            emit(ResetedPassword());
          } else {
            emit(ResetPasswordError());
          }
        } catch (e) {
          emit(ResetPasswordError());
        }
      },
    );
  }
}
