import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginSecondText extends StatelessWidget {
  const LoginSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please enter your address bellow to start using app.',
      style: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
