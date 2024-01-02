part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class GettingProfile extends ProfileState {}

class GotProfile extends ProfileState {
  final ProfileModel profile;
  const GotProfile({required this.profile});
}

class GetProfileError extends ProfileState {}
