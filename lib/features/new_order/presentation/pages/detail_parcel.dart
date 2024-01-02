// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/choose_time_page.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_detail_page/common_sizes.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_detail_page/parcel_height.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_detail_page/parcel_length.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_detail_page/parcel_weight.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_detail_page/parcel_width.dart';

class ParcelDetailPage extends StatefulWidget {
  const ParcelDetailPage({
    super.key,
    required this.parcelAbout,
    required this.parcelNumber,
    required this.parcelType,
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
  final String source;
  final String destination;
  final String phoneNumber;
  final String s_lat;
  final String s_lng;
  final String d_lat;
  final String d_lng;
  @override
  State<ParcelDetailPage> createState() => _ParcelDetailPageState();
}

class _ParcelDetailPageState extends State<ParcelDetailPage> {
  late TextEditingController _parcelWeight;
  late TextEditingController _parcelHeight;
  late TextEditingController _parcelWidth;
  late TextEditingController _parcelLength;

  @override
  void initState() {
    _parcelHeight = TextEditingController();
    _parcelWeight = TextEditingController();
    _parcelWidth = TextEditingController();
    _parcelLength = TextEditingController();
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Подробнее',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Каков вес вашей посылки',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Единица измерения: грамм',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Макс: 100 кг',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 50,
                                child: ParcelWeight(controller: _parcelWeight),
                              ),
                              const SizedBox(height: 28),
                              const Text(
                                'Каков размер вашей посылки',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Единица измерения: см',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Макс: 50см',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 50,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ParcelHeight(
                                          controller: _parcelHeight),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'x',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child:
                                          ParcelWidth(controller: _parcelWidth),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'x',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: ParcelLength(
                                          controller: _parcelLength),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 28),
                              CommonSizes(
                                height: _parcelHeight,
                                length: _parcelLength,
                                width: _parcelWidth,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      MainButton(
                        text: 'Далее',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseTimePage(
                                parcelAbout: widget.parcelAbout,
                                parcelHeight: _parcelHeight.text.isEmpty
                                    ? '0'
                                    : _parcelHeight.text,
                                parcelLength: _parcelLength.text.isEmpty
                                    ? '0'
                                    : _parcelLength.text,
                                parcelNumber: widget.parcelNumber,
                                parcelType: widget.parcelType,
                                parcelWeight: _parcelWeight.text.isEmpty
                                    ? '0'
                                    : _parcelWeight.text,
                                parcelWidth: _parcelWidth.text.isEmpty
                                    ? '0'
                                    : _parcelWidth.text,
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
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _parcelHeight.dispose();
    _parcelLength.dispose();
    _parcelWeight.dispose();
    _parcelWidth.dispose();
    super.dispose();
  }
}
