part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartGetting extends CartState {}

class CartGot extends CartState {
  final List<OrderModel> orders;
  const CartGot({required this.orders});
}

class CartGetError extends CartState {}

class OrderSending extends CartState {}

class OrderSended extends CartState {}

class OrderSendError extends CartState {}
