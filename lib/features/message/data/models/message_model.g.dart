// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as int?,
      chat: json['chat'] as int?,
      content: json['content'] as String?,
      sender: json['sender'] as int?,
      timestamp: json['timestamp'] as String?,
      is_svg: json['is_svg'] as bool?,
      is_read: json['is_read'] as bool?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      profile_id: json['profile_id'] as int?,
      profile: json['profile'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat': instance.chat,
      'sender': instance.sender,
      'content': instance.content,
      'timestamp': instance.timestamp,
      'is_svg': instance.is_svg,
      'is_read': instance.is_read,
      'name': instance.name,
      'photo': instance.photo,
      'profile_id': instance.profile_id,
      'profile': instance.profile,
    };
