import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/message/data/models/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class MessageRepository {
  getChatInfo(int chatId) async {
    final dio = Dio();
    final url = mainUrl;
    var storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    String finalUrl = '${url}chat/message/list/$chatId/';
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.get(finalUrl);
        if (kDebugMode) {
          print(response.data);
        }
        List data = response.data;
        List<MessageModel> chats = [];
        for (int i = 0; i < data.length; i++) {
          chats.add(MessageModel.fromJson(data[i]));
        }
        if (response.statusCode == 200) {
          return chats;
        } else {
          return [];
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
