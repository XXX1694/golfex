import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class PermissionUtils {
  static Future<bool> checkLocationPermission() async {
    try {
      PermissionStatus permissionStatus =
          await Location.instance.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
