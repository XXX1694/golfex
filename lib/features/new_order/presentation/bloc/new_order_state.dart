part of 'new_order_bloc.dart';

class NewOrderState extends Equatable {
  const NewOrderState();

  @override
  List<Object> get props => [];
}

class NewOrderInitial extends NewOrderState {}

class AddingOrderToCart extends NewOrderState {}

class AddedOrderToCart extends NewOrderState {}

class AddOrderToCartError extends NewOrderState {}
