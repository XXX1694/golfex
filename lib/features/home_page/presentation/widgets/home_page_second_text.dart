import 'package:flutter/material.dart';

class HomePageSecondText extends StatelessWidget {
  const HomePageSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Пожалуйста, введите свой номер отслеживания.',
      style: TextStyle(
        color: Colors.white70,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
