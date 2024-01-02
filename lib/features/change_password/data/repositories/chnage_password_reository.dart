import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class ChangePasswordRepository {
  changePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}users/update/password/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              'new_password': newPassword,
              'old_password': oldPassword,
            },
          ),
        );
        if (response.statusCode == 200) {
          await storage.setString(
            'auth_token',
            response.data['token'],
          );
          return 201;
        } else {
          return 400;
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
