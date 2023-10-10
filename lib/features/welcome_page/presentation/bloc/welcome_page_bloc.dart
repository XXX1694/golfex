import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_page_event.dart';
part 'welcome_page_state.dart';

class WelcomePageBloc extends Bloc<WelcomePageEvent, WelcomePageState> {
  WelcomePageBloc() : super(WelcomePageInitial()) {
    on<WelcomePageEvent>((event, emit) {});
  }
}
