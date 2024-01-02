part of 'left_application_bloc.dart';

abstract class LeftApplicationEvent extends Equatable {
  const LeftApplicationEvent();

  @override
  List<Object> get props => [];
}

class LeftApplication extends LeftApplicationEvent {
  final String name;
  final String phone;
  const LeftApplication({required this.name, required this.phone});
}
