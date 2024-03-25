import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/registration/data/repository/registration_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationRepository repo;
  RegistrationBloc({
    required this.repo,
    required RegistrationState registrationState,
  }) : super(RegistrationInitial()) {
    on<RegisterUser>(
      (event, emit) async {
        emit(UserRegistering());
        final res = await repo.registerPerson(
          phone: formatPhoneNumber(event.phone),
          fullName: event.fullName,
          email: event.email,
          password: event.password,
          isClient: event.isClient,
        );
        if (res == 201) {
          emit(UserRegistered());
        } else if (res == 401) {
          emit(const UserRegisterError(
              error: 'Пользователь с таким телефоном существует'));
        } else {
          emit(const UserRegisterError(error: 'Ошибка авторизации'));
        }
      },
    );
  }
}

String formatPhoneNumber(String input) {
  // Remove all non-numeric characters from the input string
  String numericString = input.replaceAll(RegExp(r'[^\d]+'), '');

  // Check if the numeric string starts with a plus sign
  if (numericString.startsWith('+')) {
    return numericString;
  } else {
    // If not, add a plus sign at the beginning
    return '+$numericString';
  }
}

String formatBinNumber(String input) {
  // Remove all non-numeric characters from the input string
  String numericString = input.replaceAll(RegExp(r'[^\d]+'), '');

  // Check if the numeric string starts with a plus sign
  if (numericString.startsWith('+')) {
    return numericString;
  } else {
    // If not, add a plus sign at the beginning
    return numericString;
  }
}
