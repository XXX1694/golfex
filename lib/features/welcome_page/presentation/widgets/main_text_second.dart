import 'package:flutter/material.dart';

class MainTextSecond extends StatelessWidget {
  const MainTextSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Купи сейчас',
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
