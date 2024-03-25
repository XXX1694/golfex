import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

import 'package:flutter/foundation.dart';
import 'package:goflex/common/colors.dart';
import 'package:intl/intl.dart';

var formatter = DateFormat('dd/MM/yyyy');

class BirthDateField extends StatefulWidget {
  const BirthDateField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime.now().subtract(const Duration(days: 365 * 100)),
          maxTime: DateTime.now().add(const Duration(days: 365 * 100)),
          onChanged: (date) {
            if (kDebugMode) {
              print('change $date');
            }
          },
          onConfirm: (date) {
            if (kDebugMode) {
              print('confirm $date');
            }
            setState(
              () {
                widget.controller.text =
                    DateFormat('yyyy-MM-dd').format(date).toString();
              },
            );
          },
          currentTime: DateTime.now(),
        );
      },
      style: const TextStyle(
        color: Colors.black87,
        fontSize: 14,
      ),
      decoration: const InputDecoration(
        hintText: 'Выберите дату',
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
