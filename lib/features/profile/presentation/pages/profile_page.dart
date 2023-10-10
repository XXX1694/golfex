import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:goflex/features/profile/presentation/widgets/app_settings.dart';
import 'package:goflex/features/profile/presentation/widgets/profile_menu.dart';
import 'package:goflex/features/profile/presentation/widgets/profile_top.dart';
import 'package:goflex/features/profile/presentation/widgets/recent_orders.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/notification');
              },
              child: SvgPicture.asset(
                'assets/icons/ring_black.svg',
                height: 24,
                width: 24,
              ),
            ),
          )
        ],
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'go',
                style: GoogleFonts.montserrat(
                  color: accentColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'flex',
                style: GoogleFonts.montserrat(
                  color: mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProfileTop(),
              SizedBox(height: 24),
              RecentOrders(),
              SizedBox(height: 24),
              ProfileMenu(),
              SizedBox(height: 24),
              AppSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
