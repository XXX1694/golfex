import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_to_orders_event.dart';
part 'cart_to_orders_state.dart';

class CartToOrdersBloc extends Bloc<CartToOrdersEvent, CartToOrdersState> {
  CartToOrdersBloc() : super(CartToOrdersInitial()) {
    on<AddAll>(
      (event, emit) async {
        emit(Adding());
      },
    );
  }
}
