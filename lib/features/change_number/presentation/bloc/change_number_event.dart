part of 'change_number_bloc.dart';

abstract class ChangeNumberEvent extends Equatable {
  const ChangeNumberEvent();

  @override
  List<Object> get props => [];
}

class ChangeNumber extends ChangeNumberEvent {
  final String number;
  const ChangeNumber({required this.number});
}
