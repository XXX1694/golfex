import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class LoginRepository {
  logIn({
    required String phone,
    required String password,
  }) async {
    final storage = await _storage;
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}auth/token/login/';

    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        if (kDebugMode) {
          print(
            jsonEncode(
              {
                'phone': formatPhoneNumber(phone),
                'password': password,
              },
            ),
          );
        }
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              'phone': formatPhoneNumber(phone),
              'password': password,
            },
          ),
        );
        if (kDebugMode) {
          print(response.data);
        }

        if (response.statusCode == 200) {
          await storage.setString(
            'auth_token',
            response.data['auth_token'],
          );
          if (kDebugMode) {
            print('User log in ${response.data['auth_token']}');
          }
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

String formatPhoneNumber(String input) {
  // Remove all non-numeric characters from the input string
  String numericString = input.replaceAll(RegExp(r'[^\d]+'), '');

  // Check if the numeric string starts with a plus sign
  if (numericString.startsWith('+')) {
    return numericString;
  } else {
    // If not, add a plus sign at the beginning
    return '+$numericString';
  }
}
