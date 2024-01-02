// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/detail_parcel.dart';
import 'package:goflex/features/new_order/presentation/widgets/choose_parcel_page/about_parcel.dart';
import 'package:goflex/features/new_order/presentation/widgets/choose_parcel_page/parcel_count.dart';
import 'package:goflex/features/new_order/presentation/widgets/choose_parcel_page/parcel_type.dart';

class ChooseParcelPage extends StatefulWidget {
  const ChooseParcelPage({
    super.key,
    required this.source,
    required this.destination,
    required this.phoneNumber,
    required this.d_lat,
    required this.d_lng,
    required this.s_lat,
    required this.s_lng,
  });
  final String source;
  final String destination;
  final String d_lat;
  final String d_lng;
  final String s_lat;
  final String s_lng;
  final String phoneNumber;
  @override
  State<ChooseParcelPage> createState() => _ChooseParcelPageState();
}

class _ChooseParcelPageState extends State<ChooseParcelPage> {
  late TextEditingController _parcelTypeController;
  late TextEditingController _parcelNumberController;
  late TextEditingController _parcelAboutController;
  @override
  void initState() {
    _parcelAboutController = TextEditingController();
    _parcelNumberController = TextEditingController();
    _parcelTypeController = TextEditingController();
    _parcelNumberController.text = '1';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        foregroundColor: Colors.white,
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
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                            const Text(
                              'Что вы отпровляете',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 28),
                            Expanded(
                              child: AboutParcel(
                                controller: _parcelAboutController,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ParcelCount(controller: _parcelNumberController),
                            const SizedBox(height: 24),
                            const ParcelType(),
                            const SizedBox(height: 40),
                            MainButton(
                              text: 'Продолжить',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ParcelDetailPage(
                                      parcelAbout: _parcelAboutController.text,
                                      parcelNumber:
                                          _parcelNumberController.text,
                                      parcelType: _parcelTypeController.text,
                                      source: widget.source,
                                      destination: widget.destination,
                                      phoneNumber: widget.phoneNumber,
                                      d_lat: widget.d_lat,
                                      d_lng: widget.d_lng,
                                      s_lat: widget.s_lat,
                                      s_lng: widget.s_lng,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
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

  @override
  void dispose() {
    _parcelAboutController.dispose();
    _parcelTypeController.dispose();
    _parcelNumberController.dispose();
    super.dispose();
  }
}
