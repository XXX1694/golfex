import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class LoginMainText extends StatelessWidget {
  const LoginMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Добро пожаловать в gofl',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'ex',
            style: TextStyle(
              color: mainColor,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
