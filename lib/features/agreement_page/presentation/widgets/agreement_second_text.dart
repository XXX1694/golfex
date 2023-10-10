import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgreementSecondText extends StatelessWidget {
  const AgreementSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please read the rules of the app.',
      style: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
