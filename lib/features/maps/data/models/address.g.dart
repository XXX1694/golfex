// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      address_name: json['address_name'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      full_name: json['full_name'] as String?,
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address_name': instance.address_name,
      'full_name': instance.full_name,
      'id': instance.id,
    };
