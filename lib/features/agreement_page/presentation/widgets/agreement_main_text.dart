import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class AgreementMainText extends StatelessWidget {
  const AgreementMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'Добро пожаловать в go',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'flex.',
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
