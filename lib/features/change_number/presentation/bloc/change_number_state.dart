part of 'change_number_bloc.dart';

class ChangeNumberState extends Equatable {
  const ChangeNumberState();

  @override
  List<Object> get props => [];
}

class ChangeNumberInitial extends ChangeNumberState {}

class NumberChanging extends ChangeNumberState {}

class NumberChanged extends ChangeNumberState {}

class NumberChangeError extends ChangeNumberState {}
