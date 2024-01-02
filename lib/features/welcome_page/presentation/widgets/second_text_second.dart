import 'package:flutter/material.dart';

class SecondTextSecond extends StatelessWidget {
  const SecondTextSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Не пройдя ни шагу',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
