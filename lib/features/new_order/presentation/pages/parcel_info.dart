// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/main_page/presentation/pages/main_pagge.dart';
import 'package:goflex/features/new_order/data/repository/add_repository.dart';
import 'package:goflex/features/new_order/presentation/bloc/new_order_bloc.dart';
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
    required this.images,
    required this.source,
    required this.destination,
    required this.phoneNumber,
    required this.d_lat,
    required this.d_lng,
    required this.s_lat,
    required this.s_lng,
    required this.distance,
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
  final List<String> images;
  final String source;
  final String destination;
  final String phoneNumber;
  final String d_lng;
  final String d_lat;
  final String s_lat;
  final String s_lng;
  final double distance;
  final String? delivery_time;
  final String? delivery_date;
  final String? pickup_date;
  final String? pickup_time;

  @override
  State<ParcelInfoPage> createState() => _ParcelInfoPageState();
}

class _ParcelInfoPageState extends State<ParcelInfoPage> {
  late NewOrderBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<NewOrderBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewOrderBloc, NewOrderState>(
      listener: (context, state) {
        if (state is AddedOrderToCart) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(page: 0),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Добавлено в корзину'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
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
                                  phoneNumber: widget.phoneNumber,
                                  lat: widget.s_lat,
                                  lng: widget.s_lng,
                                ),
                                const SizedBox(height: 16),
                                DestinationInfo(
                                  to: widget.destination,
                                  phoneNumber: '',
                                  lat: widget.d_lat,
                                  lng: widget.d_lng,
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
                                const CourierInfo(price: 1000),
                              ],
                            ),
                          ),
                        ),
                        MainButton(
                          text: 'Отправить в корзину',
                          onPressed: () async {
                            AddToCartRepository repo = AddToCartRepository();
                            final int dist = await repo.calculateDistance(
                              s_lat: widget.s_lat,
                              s_long: widget.s_lng,
                              d_lat: widget.d_lat,
                              d_long: widget.d_lng,
                            );
                            bloc.add(
                              AddOrder(
                                order: OrderModel(
                                  delivery_service: 1,
                                  description: widget.parcelAbout,
                                  from_where: {
                                    'address': widget.source,
                                    'latitude': widget.s_lat,
                                    'longitude': widget.s_lng,
                                  },
                                  product: {
                                    'amount': int.parse(widget.parcelNumber),
                                    'total_weight_kg': widget.parcelWeight,
                                    'images': widget.images,
                                    'width_cm': widget.parcelWidth,
                                    'height_cm': widget.parcelHeight,
                                    'length_cm': widget.parcelLength,
                                  },
                                  sender: '',
                                  status: '',
                                  term: '',
                                  to_where: {
                                    'address': widget.destination,
                                    'latitude': widget.d_lat,
                                    'longitude': widget.d_lng,
                                  },
                                  tracking_number: '',
                                  consumer: widget.phoneNumber,
                                  price: 1000,
                                  delivery_date: widget.delivery_date,
                                  delivery_time: widget.delivery_time,
                                  pickup_date: widget.pickup_date,
                                  pickup_time: widget.pickup_time,
                                  distance: dist / 1000,
                                  seller_rate: 1,
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
      ),
    );
  }
}
