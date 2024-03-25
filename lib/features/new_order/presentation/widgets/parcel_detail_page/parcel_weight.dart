import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ParcelWeight extends StatefulWidget {
  const ParcelWeight({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<ParcelWeight> createState() => _ParcelWeightState();
}

class _ParcelWeightState extends State<ParcelWeight> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        int value = int.tryParse(widget.controller.text) ?? 0;
        if (value > 1000) {
          // If the input value is greater than 50, set it to 50
          widget.controller.text = '1000';
          widget.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: widget.controller.text.length),
          );
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Общий вес',
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
