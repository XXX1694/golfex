// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      id: json['id'] as int,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      delivery: json['delivery'] as Map<String, dynamic>,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'id': instance.id,
      'participants': instance.participants,
      'delivery': instance.delivery,
      'is_active': instance.is_active,
    };
