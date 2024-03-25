import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    super.key,
    required this.controller,
    required this.deliveryType,
  });
  final TextEditingController controller;
  final TextEditingController deliveryType;
  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.deliveryType.text == 'send'
                ? 'Номер получателя'
                : 'Номер отправителя',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            child: TextField(
              controller: widget.controller,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                hintText: '+7 (XXX) XXX XX XX',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainColor20,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black12,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [maskFormatter],
            ),
          ),
        ],
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
