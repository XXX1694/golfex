import 'package:flutter/material.dart';

class ChooseRoleMainText extends StatelessWidget {
  const ChooseRoleMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Кто вы?',
      style: TextStyle(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
