import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';

class CompanyNameField extends StatelessWidget {
  const CompanyNameField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: mainColor),
        labelText: 'Company name',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),
      keyboardType: TextInputType.name,
    );
  }
}
