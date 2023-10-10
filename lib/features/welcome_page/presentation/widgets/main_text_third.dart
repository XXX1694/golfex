import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTextThird extends StatelessWidget {
  const MainTextThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Professional Service',
      style: GoogleFonts.montserrat(
        color: Colors.black,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
