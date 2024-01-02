import 'package:flutter/material.dart';

class LoginSecondText extends StatelessWidget {
  const LoginSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Пожалуйста, введите свой номер ниже, чтобы начать пользоваться приложением.',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
