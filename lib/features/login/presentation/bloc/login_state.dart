part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LogingIn extends LoginState {}

class LogedIn extends LoginState {}

class LogInError extends LoginState {}
