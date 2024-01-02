// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/order_info/presentation/bloc/order_info_bloc.dart';
import 'package:goflex/features/order_info/presentation/widgets/coordinates.dart';

import '../widgets/courier_info.dart';
import '../widgets/destination_info.dart';
import '../widgets/parcel_info.dart';
import '../widgets/source_info.dart';

class OrderInfoPage extends StatefulWidget {
  const OrderInfoPage({
    super.key,
    required this.tracking_number,
    required this.delete,
  });
  final String tracking_number;
  final bool delete;

  @override
  State<OrderInfoPage> createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  late OrderInfoBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<OrderInfoBloc>(context);
    bloc.add(GetInfo(trackin_number: widget.tracking_number));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderInfoBloc, OrderInfoState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xFF222222),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF222222),
          elevation: 0,
          title: const Text(
            'Информация о заказе',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            widget.delete
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(
                          Delete(trackin_number: widget.tracking_number),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Заказ удален, пожалуйста обновите корзину'),
                          ),
                        );
                      },
                      child: const Icon(Icons.delete),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: state is InfoGetting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is InfoGot
                      ? Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SafeArea(
                              child: Column(
                                children: [
                                  const SizedBox(height: 32),
                                  Text(
                                    '${state.orderModel.status}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SourceInfo(
                                            from: state.orderModel
                                                    .from_where?['address'] ??
                                                '',
                                            phoneNumber:
                                                state.orderModel.sender ??
                                                    'Пусто',
                                          ),
                                          const SizedBox(height: 16),
                                          DestinationInfo(
                                            to: state.orderModel
                                                    .to_where?['address'] ??
                                                '',
                                            phoneNumber:
                                                state.orderModel.consumer ??
                                                    'Пусто',
                                          ),
                                          const SizedBox(height: 16),
                                          ParcelInfo(
                                            weight: state.orderModel
                                                    .product?['total_weight_kg']
                                                    .toString() ??
                                                '0',
                                            count: state.orderModel
                                                    .product?['amount']
                                                    .toString() ??
                                                '1',
                                            description:
                                                state.orderModel.description ??
                                                    '',
                                            height: state.orderModel
                                                    .product?['height_cm']
                                                    .toString() ??
                                                '0',
                                            length: state.orderModel
                                                    .product?['length_cm']
                                                    .toString() ??
                                                '0',
                                            width: state.orderModel
                                                    .product?['width_cm']
                                                    .toString() ??
                                                '0',
                                          ),
                                          const SizedBox(height: 16),
                                          CourierInfo(
                                              price:
                                                  state.orderModel.price ?? 0),
                                          const SizedBox(height: 16),
                                          CoordinatesPart(
                                              s_lat:
                                                  state.orderModel.from_where?[
                                                          'latitude'] ??
                                                      '0',
                                              s_lng:
                                                  state.orderModel.from_where?[
                                                          'longitude'] ??
                                                      '0',
                                              d_lat: state.orderModel
                                                      .to_where?['latitude'] ??
                                                  '0',
                                              d_lng: state.orderModel
                                                      .to_where?['longitude'] ??
                                                  '0')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : const Center(
                          child: Text('Ошибка'),
                        ),
            )
          ],
        ),
      ),
    );
  }
}
