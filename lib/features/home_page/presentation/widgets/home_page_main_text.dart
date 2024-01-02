import 'package:flutter/material.dart';

class HomePageMainText extends StatelessWidget {
  const HomePageMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Отслеживайте посылку',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
