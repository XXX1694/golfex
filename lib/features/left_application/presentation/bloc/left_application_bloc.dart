import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/left_application/data/repositories/left_application_repository.dart';

part 'left_application_event.dart';
part 'left_application_state.dart';

class LeftApplicationBloc
    extends Bloc<LeftApplicationEvent, LeftApplicationState> {
  LeftApplicationRepository repo;
  LeftApplicationBloc({
    required this.repo,
    required LeftApplicationState leftApplicationState,
  }) : super(LeftApplicationInitial()) {
    on<LeftApplication>(
      (event, emit) async {
        emit(ApplicationLefting());
        try {
          final res =
              await repo.leftApplication(phone: event.phone, name: event.name);
          if (res == 201) {
            emit(ApplicationLefted());
          } else {
            emit(ApplicationLeftError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(ApplicationLeftError());
        }
      },
    );
  }
}
