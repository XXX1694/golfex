import 'package:flutter/material.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 10,
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
                Navigator.pushNamed(context, '/settings');
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Параметры',
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
                Navigator.pushNamed(context, '/about');
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'О приложении',
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
                Navigator.pushNamed(context, '/help');
              },
              child: const Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Помощь',
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
