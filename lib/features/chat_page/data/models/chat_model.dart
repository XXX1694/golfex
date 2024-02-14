// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  final int id;
  final List<Map<String, dynamic>> participants;
  final Map<String, dynamic> delivery;
  final bool is_active;
  ChatModel({
    required this.id,
    required this.participants,
    required this.delivery,
    required this.is_active,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
