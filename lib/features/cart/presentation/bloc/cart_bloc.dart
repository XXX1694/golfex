import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/features/cart/data/repositories/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repo;
  CartBloc({
    required this.repo,
    required CartState cartState,
  }) : super(CartInitial()) {
    on<GetCart>(
      (event, emit) async {
        emit(CartGetting());
        try {
          List<OrderModel> res = await repo.getCart();
          if (res.isNotEmpty) {
            emit(CartGot(orders: res));
          } else {
            emit(CartGetError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(CartGetError());
        }
      },
    );
    on<SendOrders>(
      (event, emit) async {
        emit(OrderSending());
        try {
          final res = await repo.sendAll();
          if (res == 200) {
            emit(OrderSended());
          } else {
            emit(OrderSendError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(OrderSendError());
        }
      },
    );
  }
}
