import 'package:flutter/material.dart';

class SecondTextThird extends StatelessWidget {
  const SecondTextThird({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'С помощью онлайн-базара',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
