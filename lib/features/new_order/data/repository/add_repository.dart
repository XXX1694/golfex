// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/common/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _storage = SharedPreferences.getInstance();

class AddToCartRepository {
  addToCart({
    required OrderModel order,
  }) async {
    final storage = await _storage;
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}order/create/';
    String? token = storage.getString('auth_token');
    if (token == null) return null;
    dio.options.headers["authorization"] = "Token $token";
    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        if (kDebugMode) {
          print(
            jsonEncode(
              {
                "from_where": {
                  "address": order.from_where?['address'] ?? '',
                  "latitude": order.from_where?['latitude'] ?? '',
                  "longitude": order.from_where?['longitude'] ?? '',
                },
                "to_where": {
                  "address": order.to_where?['address'] ?? '',
                  "latitude": order.to_where?['latitude'] ?? '',
                  "longitude": order.to_where?['longitude'] ?? '',
                },
                "product": {
                  "description": order.description ?? '',
                  "amount": order.product?['amount'] ?? 1,
                  "total_weight_kg":
                      int.parse(order.product?['total_weight_kg'] ?? '0'),
                  "width_cm": int.parse(order.product?['width_cm'] ?? '0'),
                  "height_cm": int.parse(order.product?['height_cm'] ?? 0),
                  "length_cm": int.parse(order.product?['length_cm'] ?? 0),
                  // "images": order.products?['images'] ?? []
                },
                "price": order.seller_rate == 1
                    ? ((order.distance ?? 0) <= 12
                        ? 2500
                        : 2500 + ((order.distance ?? 0) - 12) * 100)
                    : ((order.distance ?? 0) <= 12
                        ? 1000
                        : 1000 + ((order.distance ?? 0) - 12) * 80),
                "consumer": order.consumer,
                "delivery_date": order.delivery_date,
                "delivery_time": order.delivery_time,
                "pickup_date": order.pickup_date,
                "pickup_time": order.pickup_time,
                "distance": order.distance,
                "seller_rate": order.seller_rate ?? 1
              },
            ),
          );
        }
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              "from_where": {
                "address": order.from_where?['address'] ?? '',
                "latitude": order.from_where?['latitude'] ?? '',
                "longitude": order.from_where?['longitude'] ?? '',
              },
              "to_where": {
                "address": order.to_where?['address'] ?? '',
                "latitude": order.to_where?['latitude'] ?? '',
                "longitude": order.to_where?['longitude'] ?? '',
              },
              "product": {
                "description": order.description ?? '',
                "amount": order.product?['amount'] ?? 1,
                "total_weight_kg":
                    int.parse(order.product?['total_weight_kg'] ?? '0'),
                "width_cm": int.parse(order.product?['width_cm'] ?? '0'),
                "height_cm": int.parse(order.product?['height_cm'] ?? 0),
                "length_cm": int.parse(order.product?['length_cm'] ?? 0),
                // "images": order.products?['images'] ?? []
              },
              "price": order.seller_rate == 1
                  ? ((order.distance ?? 0) <= 12
                      ? 2500
                      : 2500 + ((order.distance ?? 0) - 12) * 100)
                  : ((order.distance ?? 0) <= 12
                      ? 1000
                      : 1000 + ((order.distance ?? 0) - 12) * 80),
              "consumer": order.consumer,
              "delivery_date": order.delivery_date,
              "delivery_time": order.delivery_time,
              "pickup_date": order.pickup_date,
              "pickup_time": order.pickup_time,
              "distance": order.distance,
              "seller_rate": order.seller_rate ?? 1
            },
          ),
        );
        // if (kDebugMode) {
        //   print(response.data);
        // }

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

  calculateDistance({
    required String s_lat,
    required String s_long,
    required String d_lat,
    required String d_long,
  }) async {
    try {
      final dio = Dio();
      final String finalUrl =
          'https://routing.api.2gis.com/get_dist_matrix?key=$dgisApi&version=2.0';

      final response = await dio.post(
        finalUrl,
        data: jsonEncode(
          {
            "points": [
              {
                "lat": double.parse(s_lat),
                "lon": double.parse(s_long),
              },
              {
                "lat": double.parse(d_lat),
                "lon": double.parse(d_long),
              }
            ],
            "sources": [0],
            "targets": [1]
          },
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        return response.data['routes'][0]['distance'];
      } else {
        return 0;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return 0;
    }
  }
}
