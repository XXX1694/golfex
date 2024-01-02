// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/add_image.dart';
import 'package:goflex/features/new_order/presentation/widgets/choose_time_page/date_time_field.dart';
import 'package:goflex/features/new_order/presentation/widgets/choose_time_page/time_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseTimePage extends StatefulWidget {
  const ChooseTimePage({
    super.key,
    required this.parcelAbout,
    required this.parcelHeight,
    required this.parcelLength,
    required this.parcelNumber,
    required this.parcelType,
    required this.parcelWeight,
    required this.parcelWidth,
    required this.source,
    required this.destination,
    required this.phoneNumber,
    required this.d_lat,
    required this.d_lng,
    required this.s_lat,
    required this.s_lng,
  });
  final String parcelType;
  final String parcelNumber;
  final String parcelAbout;
  final String parcelWeight;
  final String parcelHeight;
  final String parcelWidth;
  final String parcelLength;
  final String source;
  final String destination;
  final String phoneNumber;
  final String d_lat;
  final String d_lng;
  final String s_lat;
  final String s_lng;
  @override
  State<ChooseTimePage> createState() => _ChooseTimePageState();
}

class _ChooseTimePageState extends State<ChooseTimePage> {
  late TextEditingController controller1;
  late TextEditingController controller2;
  late TextEditingController controller3;
  late TextEditingController controller4;
  List<LatLng> polilineCoordinates = [];
  double totalDistance = 0;

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text(
          'Новый заказ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Выберите время доставки',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Время забора (до)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      BirthDateField(controller: controller1),
                      const SizedBox(height: 4),
                      TimeField(controller: controller2),
                      const SizedBox(height: 32),
                      const Text(
                        'Время доставки (до)',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      BirthDateField(controller: controller3),
                      const SizedBox(height: 4),
                      TimeField(controller: controller4),
                      const Spacer(),
                      MainButton(
                          text: 'Далее',
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddImagePage(
                                  parcelAbout: widget.parcelAbout,
                                  parcelHeight: widget.parcelHeight,
                                  parcelLength: widget.parcelLength,
                                  parcelNumber: widget.parcelNumber,
                                  parcelType: widget.parcelType,
                                  parcelWidth: widget.parcelWeight,
                                  source: widget.source,
                                  destination: widget.destination,
                                  phoneNumber: widget.phoneNumber,
                                  d_lat: widget.d_lat,
                                  d_lng: widget.d_lng,
                                  s_lat: widget.s_lat,
                                  s_lng: widget.s_lng,
                                  parcelWeight: widget.parcelWeight,
                                  delivery_date: controller1.text.isEmpty
                                      ? null
                                      : controller1.text,
                                  delivery_time: controller2.text.isEmpty
                                      ? null
                                      : controller2.text,
                                  pickup_date: controller3.text.isEmpty
                                      ? null
                                      : controller3.text,
                                  pickup_time: controller4.text.isEmpty
                                      ? null
                                      : controller4.text,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<List<LatLng>> getPolyinePoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      'AIzaSyBK8UODiBnpgbTS_0AaJIHMuo3gcmXfw-Y',
      PointLatLng(double.parse(widget.s_lat), double.parse(widget.s_lng)),
      PointLatLng(double.parse(widget.d_lat), double.parse(widget.d_lng)),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polilineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    } else {
      if (kDebugMode) {
        print(result.errorMessage);
      }
    }

    for (var i = 0; i < polilineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polilineCoordinates[i].latitude,
          polilineCoordinates[i].longitude,
          polilineCoordinates[i + 1].latitude,
          polilineCoordinates[i + 1].longitude);
    }
    if (kDebugMode) {
      print(totalDistance);
    }
    return polilineCoordinates;
  }
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
