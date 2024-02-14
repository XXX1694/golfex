import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

final _storage = SharedPreferences.getInstance();

class GetUserIdRepo {
  getUserId() async {
    final storage = await _storage;
    final url = mainUrl;
    String finalUrl = '${url}users/get-id/';
    final dio = Dio();
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.get(finalUrl);

        if (response.statusCode == 200) {
          int data = response.data['id'];
          storage.setInt('user_id', data);
          return response.data['id'];
        } else {
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print('Error: $e');
        }
      }
    }
  }

  // like({required int userId}) async {
  //   final storage = await _storage;
  //   final url = mainUrl;
  //   String finalUrl = '${url}like/$userId/';
  //   final dio = Dio();
  //   String? token = storage.getString('auth_token');
  //   if (token == null) return null;
  //   dio.options.headers["authorization"] = "Token $token";
  //   Uri? uri = Uri.tryParse(finalUrl);
  //   if (uri != null) {
  //     final response = await dio.post(finalUrl);
  //     if (kDebugMode) {
  //       print(response.data);
  //     }
  //   }
  // }
}
