import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat('dd/MM/yyyy');

class TimeField extends StatefulWidget {
  const TimeField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () async {
        final TimeOfDay? timeOfDay = await showTimePicker(
          context: context,
          initialTime: selectedTime,
          initialEntryMode: TimePickerEntryMode.dial,
        );
        if (timeOfDay != null) {
          setState(() {
            widget.controller.text = '${timeOfDay.hour}:${timeOfDay.minute}';
          });
        }
      },
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
      decoration: const InputDecoration(
        hintText: 'Выберите время',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
      keyboardType: TextInputType.name,
    );
  }
}
