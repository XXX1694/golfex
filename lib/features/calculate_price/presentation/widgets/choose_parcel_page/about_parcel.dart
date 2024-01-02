import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class AboutParcel extends StatelessWidget {
  const AboutParcel({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Подробнее',
        alignLabelWithHint: true,
        floatingLabelStyle: TextStyle(color: mainColor),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),
      maxLines: 10,
      keyboardType: TextInputType.text,
    );
  }
}