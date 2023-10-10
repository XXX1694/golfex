import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageMainText extends StatelessWidget {
  const HomePageMainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Track your Shipment',
      style: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
