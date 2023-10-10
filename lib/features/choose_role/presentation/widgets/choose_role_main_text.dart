import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRoleMainText extends StatelessWidget {
  const ChooseRoleMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Who are you?',
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
