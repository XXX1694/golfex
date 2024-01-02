part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class UserRegistering extends RegistrationState {}

class UserRegistered extends RegistrationState {}

class UserRegisterError extends RegistrationState {}
