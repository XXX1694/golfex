part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class CodeSending extends ForgotPasswordState {}

class CodeSended extends ForgotPasswordState {}

class CodeSendError extends ForgotPasswordState {}
