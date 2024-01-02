import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class ChangeNameRepository {
  changeName({required String newName}) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}users/update/name/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.put(
          finalUrl,
          data: jsonEncode(
            {
              'name': newName,
            },
          ),
        );
        if (response.statusCode == 200) {
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
