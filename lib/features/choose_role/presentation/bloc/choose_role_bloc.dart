import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choose_role_event.dart';
part 'choose_role_state.dart';

class ChooseRoleBloc extends Bloc<ChooseRoleEvent, ChooseRoleState> {
  ChooseRoleBloc() : super(ChooseRoleInitial()) {
    on<ChooseRoleEvent>((event, emit) {});
  }
}
