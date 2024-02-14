import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class CartRepository {
  getCart() async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}order/cart/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.get(finalUrl);
        if (response.statusCode == 200) {
          List data = response.data;
          List<OrderModel> orders = [];
          for (int i = 0; i < data.length; i++) {
            orders.add(OrderModel.fromJson(data[i]));
          }
          return orders;
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

  sendAll() async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}order/send/';
    final storage = await _storage;
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        final response = await dio.post(finalUrl);
        if (response.statusCode == 200) {
          return 200;
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
