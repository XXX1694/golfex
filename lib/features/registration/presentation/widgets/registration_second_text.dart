import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationSecondText extends StatelessWidget {
  const RegistrationSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please put your information below to create a new account for using app.',
      style: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
