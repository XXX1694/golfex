import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class BINField extends StatelessWidget {
  const BINField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: mainColor),
        labelText: 'BIN',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [maskFormatter],
    );
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '### ### ### ###',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);
