import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/features/orders/data/repository/order_repository.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrderRepository repo;
  OrdersBloc({
    required this.repo,
    required OrdersState ordersState,
  }) : super(OrdersInitial()) {
    on<GetOrders>(
      (event, emit) async {
        emit(GettingOrders());
        try {
          List<OrderModel> res = await repo.getOrders();
          if (res.isNotEmpty) {
            emit(GotOrders(orders: res));
          } else {
            emit(GetOrdersError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(GetOrdersError());
        }
      },
    );
  }
}
