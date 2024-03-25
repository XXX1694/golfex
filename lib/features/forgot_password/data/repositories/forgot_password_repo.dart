import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';

class ForgotPasswordRepository {
  sendCode({required String email}) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}person/send-reset-code/';
    try {
      final response = await dio.post(
        finalUrl,
        data: jsonEncode(
          {
            'email': email,
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

  createPassword({
    required String email,
    required String code,
    required String password,
  }) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}person/reset-password/';
    try {
      final response = await dio.post(
        finalUrl,
        data: jsonEncode(
          {
            'email': email,
            'code': code,
            'new_password': password,
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
