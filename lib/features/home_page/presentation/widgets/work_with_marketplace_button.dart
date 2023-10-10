import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkWithMarketplaceButton extends StatelessWidget {
  const WorkWithMarketplaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0XFF222222),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0XFFE9E9E9),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                    'Working with Marketplace',
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Read more',
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            height: 10,
                            width: 10,
                            // ignore: deprecated_member_use
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
