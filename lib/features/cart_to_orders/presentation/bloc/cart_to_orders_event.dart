part of 'cart_to_orders_bloc.dart';

abstract class CartToOrdersEvent extends Equatable {
  const CartToOrdersEvent();

  @override
  List<Object> get props => [];
}

class AddAll extends CartToOrdersEvent {}
