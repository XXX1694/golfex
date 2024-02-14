import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/main_page/presentation/pages/main_pagge.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_info/courier_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_info/destination_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_info/parcel_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/parcel_info/source_info.dart';

class ParcelInfoPage extends StatefulWidget {
  const ParcelInfoPage({
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
    required this.distance,
    required this.price,
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
  final double distance;
  final double price;
  @override
  State<ParcelInfoPage> createState() => _ParcelInfoPageState();
}

class _ParcelInfoPageState extends State<ParcelInfoPage> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Информация о заказе',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 26),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SourceInfo(
                                from: widget.source,
                                phoneNumber: widget.destination,
                                lat: '',
                                lng: '',
                              ),
                              const SizedBox(height: 16),
                              DestinationInfo(
                                to: widget.destination,
                                phoneNumber: 'пусто',
                                lat: '',
                                lng: '',
                              ),
                              const SizedBox(height: 16),
                              ParcelInfo(
                                weight: widget.parcelWeight,
                                count: widget.parcelNumber,
                                description: widget.parcelAbout,
                                height: widget.parcelHeight,
                                length: widget.parcelLength,
                                width: widget.parcelWidth,
                              ),
                              const SizedBox(height: 16),
                              CourierInfo(
                                price: widget.price,
                              )
                            ],
                          ),
                        ),
                      ),
                      MainButton(
                        text: 'Вернуться в меню',
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainPage(
                                  page: 0,
                                ),
                              ),
                              (route) => false);
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
}
