import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationMainText extends StatelessWidget {
  const RegistrationMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Create a new account',
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
