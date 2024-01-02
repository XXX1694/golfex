import 'package:flutter/material.dart';

class ChooseRoleSecondText extends StatelessWidget {
  const ChooseRoleSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Пожалуйста, выберите, от имени кого вы будете использовать приложение. Как человек или организация.',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
