import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_page_new_event.dart';
part 'home_page_new_state.dart';

class HomePageNewBloc extends Bloc<HomePageNewEvent, HomePageNewState> {
  HomePageNewBloc() : super(HomePageNewInitial()) {
    on<HomePageNewEvent>((event, emit) {});
  }
}
