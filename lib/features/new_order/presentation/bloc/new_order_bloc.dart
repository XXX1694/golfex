import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  NewOrderBloc() : super(NewOrderInitial()) {
    on<NewOrderEvent>((event, emit) {});
  }
}
