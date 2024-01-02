part of 'order_info_bloc.dart';

class OrderInfoState extends Equatable {
  const OrderInfoState();

  @override
  List<Object> get props => [];
}

class OrderInfoInitial extends OrderInfoState {}

class InfoGetting extends OrderInfoState {}

class InfoGot extends OrderInfoState {
  final OrderModel orderModel;
  const InfoGot({required this.orderModel});
}

class InfoGetError extends OrderInfoState {}
