import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_number/data/repositories/number_repository.dart';

part 'change_number_event.dart';
part 'change_number_state.dart';

class ChangeNumberBloc extends Bloc<ChangeNumberEvent, ChangeNumberState> {
  final NumberRepository repo;
  ChangeNumberBloc({
    required this.repo,
    required ChangeNumberState changeNumberState,
  }) : super(ChangeNumberInitial()) {
    on<ChangeNumber>(
      (event, emit) async {
        emit(NumberChanging());
        try {
          final res = await repo.changeNumber(
            phoneNumber: event.number,
          );
          if (res == 201) {
            emit(NumberChanged());
          } else {
            emit(NumberChangeError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(NumberChanging());
        }
      },
    );
  }
}
