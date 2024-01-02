part of 'change_name_bloc.dart';

class ChangeNameState extends Equatable {
  const ChangeNameState();

  @override
  List<Object> get props => [];
}

class ChangeNameInitial extends ChangeNameState {}

class NameChanging extends ChangeNameState {}

class NameChanged extends ChangeNameState {}

class NameChangeError extends ChangeNameState {}
