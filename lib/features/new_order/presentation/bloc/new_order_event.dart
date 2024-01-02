part of 'new_order_bloc.dart';

abstract class NewOrderEvent extends Equatable {
  const NewOrderEvent();

  @override
  List<Object> get props => [];
}

class AddOrder extends NewOrderEvent {
  final OrderModel order;
  const AddOrder({required this.order});
}
