import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class OrderInfoRepository {
  getInfo({required String trackingNumber}) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}order/$trackingNumber/info/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.get(finalUrl);
        if (kDebugMode) {
          print(response.data);
        }
        if (response.statusCode == 200) {
          return OrderModel.fromJson(response.data);
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

  delete({required String trackingNumber}) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}order/delete/$trackingNumber/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.delete(finalUrl);
        if (kDebugMode) {
          print(response.data);
        }
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
