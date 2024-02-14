// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class AddressModel {
  final String? name;
  final String? address_name;
  final String? full_name;
  final String? id;

  AddressModel({
    required this.address_name,
    required this.id,
    required this.name,
    required this.full_name,
  });
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
