import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:goflex/features/home_page/presentation/pages/home_page.dart';
import 'package:goflex/features/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: mainColor,
        inactiveColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/main_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/main_filled.svg'),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/orders_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/orders_filled.svg'),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/profile_filled.svg'),
            label: 'Profile',
          ),
        ],
        onTap: (value) {
          setState(() {});
        },
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const Scaffold();
          case 2:
            return const ProfilePage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
