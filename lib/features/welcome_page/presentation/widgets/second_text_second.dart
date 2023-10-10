import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondTextSecond extends StatelessWidget {
  const SecondTextSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Ship and track parcels and packages and learn about our express courier services!',
      style: GoogleFonts.montserrat(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
