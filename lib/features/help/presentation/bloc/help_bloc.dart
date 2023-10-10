import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'help_event.dart';
part 'help_state.dart';

class HelpBloc extends Bloc<HelpEvent, HelpState> {
  HelpBloc() : super(HelpInitial()) {
    on<HelpEvent>((event, emit) {});
  }
}
