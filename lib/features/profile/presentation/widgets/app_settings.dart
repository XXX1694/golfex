import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

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
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Settings',
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
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'About app',
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
              onTap: () {
                Navigator.pushNamed(context, '/help');
              },
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Help',
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
