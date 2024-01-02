import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class LeftApplicationRepository {
  leftApplication({
    required String phone,
    required String name,
  }) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}partnership/create/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        if (kDebugMode) {
          print(
            jsonEncode(
              {
                'phone': phone,
                'name': name,
              },
            ),
          );
        }
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              'phone': phone,
              'name': name,
            },
          ),
        );
        if (response.statusCode == 201) {
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
