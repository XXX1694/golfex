import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:goflex/common/constants.dart';

class RegistrationRepository {
  registerPerson({
    required String phone,
    required String fullName,
    required String iin,
    required String password,
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
                'iin': iin,
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
              'full_name': fullName,
              'iin': iin,
              'password': password,
            },
          ),
        );
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
