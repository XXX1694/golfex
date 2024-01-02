part of 'change_password_bloc.dart';

class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}

class PasswordChanging extends ChangePasswordState {}

class PasswordChanged extends ChangePasswordState {}

class PasswordChangeError extends ChangePasswordState {}
