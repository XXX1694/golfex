part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegistrationEvent {
  final String phone;
  final String fullName;
  final String iin;
  final String password;
  const RegisterUser({
    required this.fullName,
    required this.iin,
    required this.password,
    required this.phone,
  });
}

class RegisterOrganization extends RegistrationEvent {
  final String phone;
  final String organizationName;
  final String bin;
  final String password;

  const RegisterOrganization({
    required this.organizationName,
    required this.bin,
    required this.password,
    required this.phone,
  });
}
