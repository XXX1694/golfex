import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
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
        try {
          final res = await repo.registerPerson(
            phone: formatPhoneNumber(event.phone),
            fullName: event.fullName,
            iin: formatBinNumber(event.iin),
            password: event.password,
          );
          if (res == 201) {
            emit(UserRegistered());
          } else {
            emit(UserRegisterError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(UserRegisterError());
        }
      },
    );
    on<RegisterOrganization>(
      (event, emit) async {
        emit(UserRegistering());
        try {
          final res = await repo.registerOrganization(
            phone: formatPhoneNumber(event.phone),
            organizationName: event.organizationName,
            bin: formatBinNumber(event.bin),
            password: event.password,
          );
          if (res == 201) {
            emit(UserRegistered());
          } else {
            emit(UserRegisterError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(UserRegisterError());
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
