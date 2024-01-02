import 'package:flutter/material.dart';

class MainTextFirst extends StatelessWidget {
  const MainTextFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Найти из',
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
