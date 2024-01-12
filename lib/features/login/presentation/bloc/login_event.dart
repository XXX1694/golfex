part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogIn extends LoginEvent {
  final String phoneNumber;
  final String password;
  const LogIn({
    required this.phoneNumber,
    required this.password,
  });
}

class UserStatus extends LoginEvent {}

class UserLogOut extends LoginEvent {}

class UserDelete extends LoginEvent {}
