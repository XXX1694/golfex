// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final int? id;
  final int? chat;
  final int? sender;
  final String? content;
  final String? timestamp;
  final bool? is_svg;
  final bool? is_read;
  final String? name;
  final String? photo;
  final int? profile_id;
  final Map<String, dynamic>? profile;
  MessageModel({
    required this.id,
    required this.chat,
    required this.content,
    required this.sender,
    required this.timestamp,
    required this.is_svg,
    required this.is_read,
    required this.name,
    required this.photo,
    required this.profile_id,
    required this.profile,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
