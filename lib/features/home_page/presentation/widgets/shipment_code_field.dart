import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
        style: GoogleFonts.montserrat(
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
          hintText: 'Enter Your Shipment Number',
          hintStyle: GoogleFonts.montserrat(
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
        keyboardType: TextInputType.number,
        inputFormatters: [maskFormatter],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

var maskFormatter = MaskTextInputFormatter(
  mask: '### ### ### ### ###',
  filter: {
    "#": RegExp(r'[0-9]'),
  },
);
