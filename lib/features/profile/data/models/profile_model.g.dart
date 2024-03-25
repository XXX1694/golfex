// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['name'] as String,
      phone: json['phone'] as String,
      person_type: json['person_type'] as String,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'person_type': instance.person_type,
    };
