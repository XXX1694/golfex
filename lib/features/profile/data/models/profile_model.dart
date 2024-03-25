// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final String name;
  final String phone;
  // final String email;
  final String person_type;
  ProfileModel({
    required this.name,
    required this.phone,
    // required this.email,
    required this.person_type,
  });
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
