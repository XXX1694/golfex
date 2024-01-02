import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/features/new_order/data/repository/add_repository.dart';

part 'new_order_event.dart';
part 'new_order_state.dart';

class NewOrderBloc extends Bloc<NewOrderEvent, NewOrderState> {
  final AddToCartRepository repo;
  NewOrderBloc({
    required this.repo,
    required NewOrderState newOrderState,
  }) : super(NewOrderInitial()) {
    on<AddOrder>(
      (event, emit) async {
        emit(AddingOrderToCart());
        try {
          // if (kDebugMode) {
          //   print(event.order.toJson());
          // }
          final res = await repo.addToCart(order: event.order);
          if (res == 201) {
            emit(AddedOrderToCart());
          } else {
            emit(AddOrderToCartError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(AddOrderToCartError());
        }
      },
    );
  }
}
