import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/login/data/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

final _storage = SharedPreferences.getInstance();

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repo;
  LoginBloc({
    required this.repo,
    required LoginState loginState,
  }) : super(LoginInitial()) {
    on<LogIn>(
      (event, emit) async {
        emit(LogingIn());
        try {
          final res = await repo.logIn(
            phone: event.phoneNumber,
            password: event.password,
          );
          if (res == 201) {
            emit(LogedIn());
          } else {
            emit(LogInError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(LogInError());
        }
      },
    );
    on<UserStatus>(
      (event, emit) async {
        final storage = await _storage;
        String? token = storage.getString('auth_token');
        if (token != null) {
          emit(LogedIn());
        }
      },
    );
    on<UserLogOut>(
      (event, emit) async {
        final storage = await _storage;
        storage.remove('auth_token');
        emit(LoginInitial());
      },
    );
    on<UserDelete>(
      (event, emit) async {
        int res = await repo.deleteAcc();
        if (res == 200) {
          final storage = await _storage;
          storage.remove('auth_token');
          emit(LoginDeleted());
        }
      },
    );
  }
}
