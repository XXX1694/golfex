import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class NumberRepository {
  changeNumber({required String phoneNumber}) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}users/update/phone/';
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
              'phone': formatPhoneNumber(phoneNumber),
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
