import 'package:flutter/material.dart';

class MainTextThird extends StatelessWidget {
  const MainTextThird({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Попробуй',
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
