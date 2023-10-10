import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRoleSecondText extends StatelessWidget {
  const ChooseRoleSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please choose who you will use the app as. As person or organization.',
      style: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
