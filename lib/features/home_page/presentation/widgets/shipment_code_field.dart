import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/order_info/presentation/pages/order_info_page.dart';

class ShipmentCodeField extends StatefulWidget {
  const ShipmentCodeField({super.key});

  @override
  State<ShipmentCodeField> createState() => _ShipmentCodeFieldState();
}

class _ShipmentCodeFieldState extends State<ShipmentCodeField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: SvgPicture.asset(
              'assets/icons/box.svg',
              height: 20,
              width: 20,
            ),
          ),
          hintText: 'Введите номер отслежнования',
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        onSubmitted: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderInfoPage(
                tracking_number: controller.text,
                delete: false,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
