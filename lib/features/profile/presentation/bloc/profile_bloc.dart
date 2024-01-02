import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';
import 'package:goflex/features/profile/data/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repo;
  ProfileBloc({
    required this.repo,
    required ProfileState profileState,
  }) : super(ProfileInitial()) {
    on<GetProfile>(
      (event, emit) async {
        emit(GettingProfile());
        try {
          ProfileModel? res = await repo.getProfile();
          if (res != null) {
            emit(GotProfile(profile: res));
          } else {
            // emit(
            //   GotProfile(
            //     profile: ProfileModel(
            //       image: '',
            //       fullName: '',
            //       phone: '',
            //     ),
            //   ),
            // );
            emit(GetProfileError());
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
          emit(GetProfileError());
        }
      },
    );
  }
}
