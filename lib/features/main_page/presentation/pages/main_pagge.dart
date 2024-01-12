// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/cart/presentation/pages/cart_page.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/chat_page/presentation/pages/chat_page.dart';
import 'package:goflex/features/home_page/presentation/pages/home_page.dart';
import 'package:goflex/features/orders/presentation/pages/orders_page.dart';
import 'package:goflex/features/profile/presentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.page});
  final int page;
  @override
  State<MainPage> createState() => _MainPageState();
}

int selectedPage = 0;

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    selectedPage = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: mainColor,
        inactiveColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/main_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/main_filled.svg'),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/orders_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/orders_filled.svg'),
            label: 'Заказы',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/cart.svg'),
            activeIcon: SvgPicture.asset('assets/icons/cart_filled.svg'),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/chat.svg'),
            activeIcon: SvgPicture.asset('assets/icons/chat_filled.svg'),
            label: 'Чат',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile_outlined.svg'),
            activeIcon: SvgPicture.asset('assets/icons/profile_filled.svg'),
            label: 'Профиль',
          ),
        ],
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
        },
      ),
      tabBuilder: (context, index) {
        index = selectedPage;
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const OrdersPage();
          case 2:
            return const CartPage();
          case 3:
            return const ChatPage();
          case 4:
            return const ProfilePage();
          default:
            return const HomePage();
        }
      },
    );
  }
}
