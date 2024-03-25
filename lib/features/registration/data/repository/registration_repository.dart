import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';

class RegistrationRepository {
  registerPerson({
    required String phone,
    required String fullName,
    required String email,
    required String password,
    required bool isClient,
  }) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}person/register/';

    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        if (kDebugMode) {
          print(
            jsonEncode(
              {
                'phone': phone,
                'full_name': fullName,
                'email': email,
                'password': password,
                'person_type': isClient ? 'client' : 'online_shop',
              },
            ),
          );
        }
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              'phone': phone,
              'full_name': fullName,
              'password': password,
              'email': email,
              'person_type': isClient ? 'client' : 'online_shop',
            },
          ),
        );
        if (kDebugMode) {
          print('Response status: ${response.statusCode}');
          print('Response data: ${response.data}');
        }

        if (response.statusCode == 201) {
          return 201;
        } else {
          return 400;
        }
      } catch (e) {
        if (e is DioException) {
          if (e.response != null) {
            if (kDebugMode) {
              print('Error response status: ${e.response!.statusCode}');
              print('Error response data: ${e.response!.data}');
            }
            Map<String, dynamic> data = e.response!.data!;
            if (data.containsKey('phone')) return 401;
          } else {
            if (kDebugMode) {
              print('Error without response');
            }
          }
        }
      }
    }
  }

  registerOrganization({
    required String phone,
    required String organizationName,
    required String bin,
    required String password,
  }) async {
    final dio = Dio();
    final url = mainUrl;
    String finalUrl = '${url}organization/register/';

    Uri? uri = Uri.tryParse(finalUrl);
    if (uri != null) {
      try {
        if (kDebugMode) {
          print(
            jsonEncode(
              {
                'phone': phone,
                'organization_name': organizationName,
                'bin': bin,
                'password': password,
              },
            ),
          );
        }
        final response = await dio.post(
          finalUrl,
          data: jsonEncode(
            {
              'phone': phone,
              'organization_name': organizationName,
              'bin': bin,
              'password': password,
            },
          ),
        );
        if (kDebugMode) {
          print(response.data);
        }
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
