import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ParcelWidth extends StatelessWidget {
  const ParcelWidth({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Ширина',
        floatingLabelStyle: const TextStyle(color: mainColor),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
