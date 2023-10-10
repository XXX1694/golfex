import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRoleBottomText extends StatelessWidget {
  const ChooseRoleBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: GoogleFonts.montserrat(
            color: Colors.black54,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text(
            'Join now',
            style: GoogleFonts.montserrat(
              color: mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
