// ignore_for_file: non_constant_identifier_names

part of 'order_info_bloc.dart';

abstract class OrderInfoEvent extends Equatable {
  const OrderInfoEvent();

  @override
  List<Object> get props => [];
}

class GetInfo extends OrderInfoEvent {
  final String trackin_number;
  const GetInfo({required this.trackin_number});
}

class Delete extends OrderInfoEvent {
  final String trackin_number;
  const Delete({required this.trackin_number});
}
