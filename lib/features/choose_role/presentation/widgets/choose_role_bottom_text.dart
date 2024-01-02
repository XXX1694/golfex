import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ChooseRoleBottomText extends StatelessWidget {
  const ChooseRoleBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Уже есть аккаунт? ',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Войти',
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
