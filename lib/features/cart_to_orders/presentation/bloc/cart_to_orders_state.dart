part of 'cart_to_orders_bloc.dart';

class CartToOrdersState extends Equatable {
  const CartToOrdersState();

  @override
  List<Object> get props => [];
}

class CartToOrdersInitial extends CartToOrdersState {}

class Adding extends CartToOrdersState {}

class Added extends CartToOrdersState {}

class AddError extends CartToOrdersState {}
