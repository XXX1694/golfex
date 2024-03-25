import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: accentColor20,
            borderRadius: BorderRadius.circular(500),
          ),
          child: const Center(
            child: Text(
              'AS',
              style: TextStyle(
                color: accentColor,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Управление аккаунтом',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
