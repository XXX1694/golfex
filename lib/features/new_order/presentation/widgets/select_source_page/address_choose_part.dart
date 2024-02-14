// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/maps/presentation/pages/map_page_2gis.dart';

class AddressChoosePart extends StatefulWidget {
  const AddressChoosePart({
    super.key,
    required this.source,
    required this.destination,
    required this.s_lat,
    required this.s_lng,
    required this.d_lat,
    required this.d_lng,
  });
  final TextEditingController source;
  final TextEditingController s_lat;
  final TextEditingController s_lng;
  final TextEditingController destination;
  final TextEditingController d_lat;
  final TextEditingController d_lng;
  @override
  State<AddressChoosePart> createState() => _AddressChoosePartState();
}

class _AddressChoosePartState extends State<AddressChoosePart> {
  late TextEditingController fromController;
  late TextEditingController toController;
  @override
  void initState() {
    fromController = TextEditingController();
    toController = TextEditingController();
    super.initState();
  }

  void changeTo(String to, double lng, double lat) {
    setState(() {
      toController.text = to;
      widget.destination.text = to;
      widget.d_lat.text = lat.toString();
      widget.d_lng.text = lng.toString();
    });
  }

  void changeFrom(String from, double lng, double lat) {
    setState(() {
      fromController.text = from;
      widget.source.text = from;
      widget.s_lat.text = lat.toString();
      widget.s_lng.text = lng.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: mainColor20,
                ),
                child: Center(
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0XFF222222),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Container(
                height: 55,
                width: 2,
                color: Colors.black45,
              ),
              const SizedBox(height: 6),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: mainColor20,
                ),
                child: Center(
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0XFF222222),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Пунт отправки',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPageDGis(
                          controller: fromController,
                          callback: changeFrom,
                          lat: widget.s_lat,
                          lng: widget.s_lng,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    fromController.text.isEmpty
                        ? 'Введите адрес'
                        : fromController.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          color: Colors.black26,
                          width: double.infinity,
                          height: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            String temp = toController.text;
                            toController.text = fromController.text;
                            fromController.text = temp;
                          });
                        },
                        child: SvgPicture.asset(
                          'assets/icons/switch.svg',
                          height: 24,
                          width: 24,
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  'Пунт доставки',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPageDGis(
                          controller: toController,
                          callback: changeTo,
                          lat: widget.d_lat,
                          lng: widget.d_lng,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    toController.text.isEmpty
                        ? 'Введите адрес'
                        : toController.text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
