part of 'get_user_id_bloc.dart';

abstract class GetUserIdEvent extends Equatable {
  const GetUserIdEvent();

  @override
  List<Object> get props => [];
}

class GetuserId extends GetUserIdEvent {}
