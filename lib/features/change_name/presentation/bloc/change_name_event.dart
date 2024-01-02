part of 'change_name_bloc.dart';

abstract class ChangeNameEvent extends Equatable {
  const ChangeNameEvent();

  @override
  List<Object> get props => [];
}

class ChangeName extends ChangeNameEvent {
  final String newName;
  const ChangeName({required this.newName});
}
