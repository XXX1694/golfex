import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/maps/data/models/address.dart';

class MapRepository {
  getAddressByLatLong({
    required String lat,
    required String long,
  }) async {
    final dio = Dio();
    String finalUrl =
        'https://catalog.api.2gis.com/3.0/items/geocode?lon=$long&lat=$lat&fields=items.point&key=$dgisApi';
    if (kDebugMode) {
      print(finalUrl);
    }

    try {
      final response = await dio.get(finalUrl);

      if (response.statusCode == 200) {
        return {
          'status': 200,
          'address': response.data['result']['items'][0]['name'],
        };
      } else {
        return {
          'status': 400,
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getLatLongByAddress({
    required String address,
  }) async {
    final dio = Dio();
    String finalUrl =
        'https://catalog.api.2gis.com/3.0/items/geocode?q=$address&fields=items.point&key=$dgisApi';
    if (kDebugMode) {
      print(finalUrl);
    }
    try {
      final response = await dio.get(finalUrl);
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        return {
          'status': 200,
          'lat': response.data['result']['items'][0]['point']['lat'],
          'long': response.data['result']['items'][0]['point']['lon'],
        };
      } else {
        return {
          'status': 400,
        };
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  suggetAddress({required String place}) async {
    final dio = Dio();
    String finalUrl =
        'https://catalog.api.2gis.com/3.0/suggests?q=$place&location=76.889709,43.238949&key=64cca5be-30f8-4772-8d5c-d64bab285c67';

    try {
      final response = await dio.get(finalUrl);

      if (response.statusCode == 200) {
        List data = response.data['result']['items'];
        List<AddressModel> suggests = [];
        for (int i = 0; i < data.length; i++) {
          Map<String, dynamic> item = data[i];
          if (item.containsKey('full_name')) {
            suggests.add(AddressModel.fromJson(item));
          }
        }
        return suggests;
      } else {
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  calculateDistance({
    required String fromLat,
    required String fromLong,
    required String toLat,
    required String toLong,
  }) async {
    final dio = Dio();
    String finalUrl =
        'https://routing.api.2gis.com/carrouting/6.0.0/global?key=64cca5be-30f8-4772-8d5c-d64bab285c67';

    try {
      final response = await dio.post(
        finalUrl,
        data: jsonEncode(
          {
            "points": [
              {
                "type": "car",
                "x": double.parse(fromLong),
                "y": double.parse(fromLat),
              },
              {
                "type": "car",
                "x": double.parse(toLong),
                "y": double.parse(toLat),
              }
            ]
          },
        ),
      );
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        final data = response.data;

        return data['result'][0]['total_distance'];
      } else {
        return 0;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
