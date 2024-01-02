import 'package:flutter/material.dart';

class AgreementSecondText extends StatelessWidget {
  const AgreementSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Пожалуйста, ознакомьтесь с правилами приложения.',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
