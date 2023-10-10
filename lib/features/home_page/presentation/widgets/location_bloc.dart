import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationBlock extends StatelessWidget {
  const LocationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Current location',
          style: GoogleFonts.montserrat(
            color: Colors.white54,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        CupertinoButton(
          onPressed: () {},
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/location.svg',
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 4),
              Text(
                'Almaty, Kazakhstan',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 12),
              SvgPicture.asset('assets/icons/bottom_arrow.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
