// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/parcel_info.dart';
import 'package:goflex/features/new_order/presentation/widgets/select_source_page/address_choose_part.dart';
import 'package:goflex/features/new_order/presentation/widgets/select_source_page/mock_image.dart';

class SelectSourcePage extends StatefulWidget {
  const SelectSourcePage({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<SelectSourcePage> createState() => _SelectSourcePageState();
}

class _SelectSourcePageState extends State<SelectSourcePage> {
  late TextEditingController source;
  late TextEditingController s_lng;
  late TextEditingController s_lat;
  late TextEditingController destinaton;
  late TextEditingController d_lng;
  late TextEditingController d_lat;
  @override
  void initState() {
    source = TextEditingController();
    s_lng = TextEditingController();
    s_lat = TextEditingController();
    destinaton = TextEditingController();
    d_lat = TextEditingController();
    d_lng = TextEditingController();
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
                        s_lat: s_lat,
                        s_lng: s_lng,
                        d_lat: d_lat,
                        d_lng: d_lng,
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Далее',
                        onPressed: () {
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => ChooseParcelPage(
                            //       source: source.text,
                            //       destination: destinaton.text,
                            //       phoneNumber: widget.phoneNumber,
                            //       d_lat: d_lat.text,
                            //       d_lng: d_lng.text,
                            //       s_lat: s_lat.text,
                            //       s_lng: s_lng.text,
                            //     ),
                            //   ),
                            // );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParcelInfoPage(
                                  source: source.text,
                                  destination: destinaton.text,
                                  phoneNumber: widget.phoneNumber,
                                  parcelAbout: '',
                                  parcelNumber: '1',
                                  parcelType: '',
                                  d_lat: d_lat.text,
                                  d_lng: d_lng.text,
                                  s_lat: s_lat.text,
                                  s_lng: s_lng.text,
                                  parcelHeight: '0',
                                  parcelLength: '0',
                                  parcelWeight: '0',
                                  parcelWidth: '0',
                                  images: const [],
                                  distance: 0.0,
                                  delivery_date: null,
                                  delivery_time: null,
                                  pickup_date: null,
                                  pickup_time: null,
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
}
