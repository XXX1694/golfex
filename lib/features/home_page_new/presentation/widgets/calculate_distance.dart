import 'dart:math';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<LatLng> polilineCoordinates = [];
double totalDistance = 0;

Future<double> calculateDistanceGoogle({
  required String fromLat,
  required String fromLong,
  required String toLat,
  required String toLong,
}) async {
  Future<List<LatLng>> getPolyinePoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBK8UODiBnpgbTS_0AaJIHMuo3gcmXfw-Y',
      PointLatLng(double.parse(fromLat), double.parse(fromLong)),
      PointLatLng(double.parse(toLat), double.parse(toLong)),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polilineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    } else {}

    for (var i = 0; i < polilineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polilineCoordinates[i].latitude,
          polilineCoordinates[i].longitude,
          polilineCoordinates[i + 1].latitude,
          polilineCoordinates[i + 1].longitude);
    }

    return polilineCoordinates;
  }

  await getPolyinePoints();
  return totalDistance;
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
