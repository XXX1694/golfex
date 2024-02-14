import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';

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
    required this.distance,
  });
  final String parcelType;
  final String parcelNumber;
  final String parcelAbout;
  final String source;
  final String destination;
  final String phoneNumber;
  final double distance;
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
                        'Макс: 1000 грамм',
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
                              child: ParcelHeight(controller: _parcelHeight),
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
                              child: ParcelWidth(controller: _parcelWidth),
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
                              child: ParcelLength(controller: _parcelLength),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Expanded(
                          child: CommonSizes(
                        height: _parcelHeight,
                        length: _parcelLength,
                        width: _parcelWidth,
                      )),
                      const SizedBox(height: 16),
                      MainButton(
                        text: 'Далее',
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ParcelInfoPage(
                          //       parcelAbout: widget.parcelAbout,
                          //       parcelHeight: _parcelHeight.text,
                          //       parcelLength: _parcelLength.text,
                          //       parcelNumber: widget.parcelNumber,
                          //       parcelType: '',
                          //       parcelWeight: _parcelWeight.text,
                          //       parcelWidth: _parcelWidth.text,
                          //       source: widget.source,
                          //       destination: widget.destination,
                          //       distance: widget.distance,
                          //     ),
                          //   ),
                          // );
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
