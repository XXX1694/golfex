part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class GettingOrders extends OrdersState {}

class GotOrders extends OrdersState {
  final List<OrderModel> orders;
  const GotOrders({required this.orders});
}

class GetOrdersError extends OrdersState {}
