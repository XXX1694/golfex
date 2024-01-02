import 'package:flutter/material.dart';
import 'package:goflex/features/calculate_price/presentation/pages/detail_parcel.dart';
import 'package:goflex/common/widgets/main_button.dart';

import '../widgets/choose_parcel_page/about_parcel.dart';
import '../widgets/choose_parcel_page/parcel_count.dart';
import '../widgets/choose_parcel_page/parcel_type.dart';

class ChooseParcelPage extends StatefulWidget {
  const ChooseParcelPage({
    super.key,
    required this.source,
    required this.destination,
    required this.distance,
  });
  final String source;
  final String destination;
  final double distance;
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
                        'Что вы отправляете',
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
                                parcelNumber: _parcelNumberController.text,
                                parcelType: _parcelTypeController.text,
                                source: widget.source,
                                destination: widget.destination,
                                phoneNumber: 'none',
                                distance: widget.distance,
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
    _parcelAboutController.dispose();
    _parcelTypeController.dispose();
    _parcelNumberController.dispose();
    super.dispose();
  }
}
