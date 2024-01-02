import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_name/data/repositories/change_name_repository.dart';

part 'change_name_event.dart';
part 'change_name_state.dart';

class ChangeNameBloc extends Bloc<ChangeNameEvent, ChangeNameState> {
  final ChangeNameRepository repo;
  ChangeNameBloc({
    required this.repo,
    required ChangeNameState changeNameState,
  }) : super(ChangeNameInitial()) {
    on<ChangeName>(
      (event, emit) async {
        emit(NameChanging());
        try {
          final res = await repo.changeName(newName: event.newName);
          if (res == 201) {
            emit(NameChanged());
          } else {
            emit(NameChangeError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(NameChangeError());
        }
      },
    );
  }
}
