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
