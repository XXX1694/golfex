import 'package:flutter/material.dart';
import 'package:goflex/features/change_name/presentation/pages/change_name.dart';
import 'package:goflex/features/change_number/presentation/pages/change_number_page.dart';
import 'package:goflex/features/change_password/presentation/pages/change_password_page.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 15,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeNumberPage(),
                  ),
                );
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Сменить номер',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(color: Colors.black26),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeNamePage(),
                  ),
                );
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Поменять имя',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(color: Colors.black26),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
                  ),
                );
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Сменить пароль',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
