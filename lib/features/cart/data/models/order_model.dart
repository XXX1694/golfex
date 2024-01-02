// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String? sender;
  final Map<String, dynamic>? from_where;
  final Map<String, dynamic>? to_where;
  final String? term;
  final String? description;
  final int? delivery_service;
  final String? status;
  final Map<String, dynamic>? product;
  final String? tracking_number;
  final String? consumer;
  final int? price;
  final String? pickup_date;
  final String? pickup_time;
  final String? delivery_date;
  final String? delivery_time;
  final double? distance;

  OrderModel({
    required this.delivery_service,
    required this.description,
    required this.from_where,
    required this.product,
    required this.sender,
    required this.status,
    required this.term,
    required this.to_where,
    required this.tracking_number,
    required this.consumer,
    required this.price,
    required this.delivery_date,
    required this.pickup_date,
    required this.pickup_time,
    required this.delivery_time,
    required this.distance,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
