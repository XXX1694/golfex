part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class SendCode extends ForgotPasswordEvent {
  final String email;
  const SendCode({required this.email});
}

class CreatePassword extends ForgotPasswordEvent {
  final String email;
  final String code;
  final String password;
  const CreatePassword({
    required this.email,
    required this.code,
    required this.password,
  });
}
