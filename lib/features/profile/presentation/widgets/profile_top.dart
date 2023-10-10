import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({super.key});

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
          child: Center(
            child: Text(
              'AS',
              style: GoogleFonts.montserrat(
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
              'Abzal',
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Управление аккаунтом',
                style: GoogleFonts.montserrat(
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
