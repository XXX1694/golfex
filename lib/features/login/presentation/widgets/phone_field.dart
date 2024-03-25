import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: '+7 (XXX) XXX XX XX',
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
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
        inputFormatters: [maskFormatter],
      ),
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);
