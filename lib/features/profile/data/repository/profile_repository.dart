import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class ProfileRepository {
  getProfile() async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}users/info/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.get(finalUrl);
        if (response.statusCode == 200) {
          if (kDebugMode) {
            print(response.data);
          }
          return ProfileModel.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }
}
