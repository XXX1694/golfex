// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      delivery_service: json['delivery_service'] as int?,
      description: json['description'] as String?,
      from_where: json['from_where'] as Map<String, dynamic>?,
      product: json['product'] as Map<String, dynamic>?,
      sender: json['sender'] as String?,
      status: json['status'] as String?,
      term: json['term'] as String?,
      to_where: json['to_where'] as Map<String, dynamic>?,
      tracking_number: json['tracking_number'] as String?,
      consumer: json['consumer'] as String?,
      price: json['price'] as int?,
      delivery_date: json['delivery_date'] as String?,
      pickup_date: json['pickup_date'] as String?,
      pickup_time: json['pickup_time'] as String?,
      delivery_time: json['delivery_time'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'sender': instance.sender,
      'from_where': instance.from_where,
      'to_where': instance.to_where,
      'term': instance.term,
      'description': instance.description,
      'delivery_service': instance.delivery_service,
      'status': instance.status,
      'product': instance.product,
      'tracking_number': instance.tracking_number,
      'consumer': instance.consumer,
      'price': instance.price,
      'pickup_date': instance.pickup_date,
      'pickup_time': instance.pickup_time,
      'delivery_date': instance.delivery_date,
      'delivery_time': instance.delivery_time,
      'distance': instance.distance,
    };
