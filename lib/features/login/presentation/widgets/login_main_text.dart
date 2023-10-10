import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginMainText extends StatelessWidget {
  const LoginMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Welcome to gofl',
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: 'ex',
            style: GoogleFonts.montserrat(
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
