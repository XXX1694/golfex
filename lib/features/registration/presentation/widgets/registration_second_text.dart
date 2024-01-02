import 'package:flutter/material.dart';

class RegistrationSecondText extends StatelessWidget {
  const RegistrationSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Пожалуйста, укажите свою информацию ниже, чтобы создать новую учетную запись для использования приложения.',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
