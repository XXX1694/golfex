import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 15,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            GestureDetector(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Orders',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(color: Colors.black26),
            GestureDetector(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Refund',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const Divider(color: Colors.black26),
            GestureDetector(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Reviews',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
