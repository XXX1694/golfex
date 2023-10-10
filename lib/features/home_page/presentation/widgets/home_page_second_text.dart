import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageSecondText extends StatelessWidget {
  const HomePageSecondText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Please Enter your tracking Number.',
      style: GoogleFonts.montserrat(
        color: Colors.white70,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
