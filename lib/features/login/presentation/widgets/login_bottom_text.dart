import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class LoginBottomText extends StatelessWidget {
  const LoginBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Не зарегистрирован? ',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/registration/person');
          },
          child: Text(
            'Регистрация',
            style: TextStyle(
              color: mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
