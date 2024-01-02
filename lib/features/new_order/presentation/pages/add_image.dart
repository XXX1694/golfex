// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/parcel_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/add_image/image_block.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddImagePage extends StatefulWidget {
  const AddImagePage({
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
    required this.delivery_date,
    required this.delivery_time,
    required this.pickup_date,
    required this.pickup_time,
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
  final String? delivery_time;
  final String? delivery_date;
  final String? pickup_date;
  final String? pickup_time;
  @override
  State<AddImagePage> createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  List<String> images = [];
  List<LatLng> polilineCoordinates = [];
  double totalDistance = 0;

  void updatePhoto(String imageUrl) {
    setState(() {
      images.add(imageUrl);
    });
  }

  @override
  void initState() {
    polilineCoordinates = [];
    totalDistance = 0;

    super.initState();
  }

  @override
  void dispose() {
    polilineCoordinates = [];
    totalDistance = 0;

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
                    children: [
                      const SizedBox(height: 40),
                      const Text(
                        'Фото посылки',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 40),
                      AddPhoto(callback: updatePhoto),
                      const Spacer(),
                      MainButton(
                        text: 'Далее',
                        onPressed: () async {
                          if (images.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Прикрепите минимум 1 изображение'),
                              ),
                            );
                          } else {
                            await getPolyinePoints();

                            // ignore: use_build_context_synchronously
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParcelInfoPage(
                                  parcelAbout: widget.parcelAbout,
                                  parcelHeight: widget.parcelHeight,
                                  parcelLength: widget.parcelLength,
                                  parcelNumber: widget.parcelNumber,
                                  parcelType: widget.parcelType,
                                  parcelWeight: widget.parcelWeight,
                                  parcelWidth: widget.parcelWidth,
                                  images: images,
                                  source: widget.source,
                                  destination: widget.destination,
                                  phoneNumber: widget.phoneNumber,
                                  d_lat: widget.d_lat,
                                  d_lng: widget.d_lng,
                                  s_lat: widget.s_lat,
                                  s_lng: widget.s_lng,
                                  distance: totalDistance,
                                  delivery_date: widget.delivery_date,
                                  delivery_time: widget.delivery_time,
                                  pickup_date: widget.pickup_date,
                                  pickup_time: widget.pickup_time,
                                ),
                              ),
                            );
                          }
                        },
                      ),
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
