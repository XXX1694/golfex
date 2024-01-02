import 'package:flutter/material.dart';

class SecondTextFirst extends StatelessWidget {
  const SecondTextFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Тысячи различных продуктов',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
