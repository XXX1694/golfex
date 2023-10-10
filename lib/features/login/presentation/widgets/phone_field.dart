import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Phone number',
        floatingLabelStyle: TextStyle(color: mainColor),
        labelStyle: GoogleFonts.montserrat(
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
      keyboardType: TextInputType.phone,
      inputFormatters: [maskFormatter],
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '+7 (###) ###-##-##',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);
