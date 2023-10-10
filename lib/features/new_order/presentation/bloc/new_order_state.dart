part of 'new_order_bloc.dart';

abstract class NewOrderState extends Equatable {
  const NewOrderState();  

  @override
  List<Object> get props => [];
}
class NewOrderInitial extends NewOrderState {}
