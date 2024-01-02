// ignore_for_file: non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/calculate_price/presentation/pages/parcel_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/select_source_page/address_choose_part.dart';
import 'package:goflex/features/new_order/presentation/widgets/select_source_page/mock_image.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectSourcePage extends StatefulWidget {
  const SelectSourcePage({super.key});
  @override
  State<SelectSourcePage> createState() => _SelectSourcePageState();
}

class _SelectSourcePageState extends State<SelectSourcePage> {
  late TextEditingController source;
  late TextEditingController destinaton;
  late TextEditingController from_lat;
  late TextEditingController from_lng;
  late TextEditingController to_lat;
  late TextEditingController to_lng;
  List<LatLng> polilineCoordinates = [];
  double totalDistance = 0;

  @override
  void initState() {
    polilineCoordinates = [];
    totalDistance = 0;
    source = TextEditingController();
    destinaton = TextEditingController();
    from_lat = TextEditingController();
    from_lng = TextEditingController();
    to_lat = TextEditingController();
    to_lng = TextEditingController();
    source.text = '';
    destinaton.text = '';
    from_lat.text = '';
    from_lng.text = '';
    to_lat.text = '';
    to_lng.text = '';
    super.initState();
  }

  @override
  void dispose() {
    source.text = '';
    destinaton.text = '';
    from_lat.text = '';
    from_lng.text = '';
    to_lat.text = '';
    to_lng.text = '';
    polilineCoordinates = [];
    totalDistance = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text(
          'Калькулятор',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                        'Выберите источник и пункт назначения',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 28),
                      const ImageMock(),
                      const Spacer(),
                      AddressChoosePart(
                        source: source,
                        destination: destinaton,
                        s_lat: from_lat,
                        s_lng: from_lng,
                        d_lat: to_lat,
                        d_lng: to_lng,
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Продолжить',
                        onPressed: () async {
                          if (source.text.isEmpty && destinaton.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Введите пункт отправки и доставки'),
                              ),
                            );
                          } else if (source.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Введите пункт отправки'),
                              ),
                            );
                          } else if (destinaton.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Введите пункт доставки'),
                              ),
                            );
                          } else {
                            await getPolyinePoints();
                            // print(totalDistance);
                            // ignore: use_build_context_synchronously
                            await Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParcelInfoPage(
                                    source: source.text,
                                    destination: destinaton.text,
                                    distance: totalDistance,
                                    parcelAbout: '',
                                    parcelHeight: '',
                                    parcelLength: '',
                                    parcelNumber: '',
                                    parcelType: '',
                                    parcelWeight: '',
                                    parcelWidth: '',
                                  ),
                                ),
                                (route) => false);
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
      PointLatLng(double.parse(from_lat.text), double.parse(from_lng.text)),
      PointLatLng(double.parse(to_lat.text), double.parse(to_lng.text)),
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
}

double calculateDistance(lat1, lon1, lat2, lon2) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}
