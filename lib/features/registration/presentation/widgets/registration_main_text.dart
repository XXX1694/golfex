import 'package:flutter/material.dart';

class RegistrationMainText extends StatelessWidget {
  const RegistrationMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Создать аккаунт',
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
