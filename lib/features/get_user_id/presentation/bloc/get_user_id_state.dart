part of 'get_user_id_bloc.dart';

class GetUserIdState extends Equatable {
  const GetUserIdState();

  @override
  List<Object> get props => [];
}

class GetUserIdInitial extends GetUserIdState {}

class GettingUserId extends GetUserIdState {}

class GotUserId extends GetUserIdState {
  final int userId;
  const GotUserId({required this.userId});
}

class GetUserIdError extends GetUserIdState {}
