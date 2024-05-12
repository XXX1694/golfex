// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/cart/presentation/pages/cart_page.dart';
import 'package:goflex/features/chat_page/presentation/pages/chat_page.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/pages/login_page_new.dart';
import 'package:goflex/features/orders/presentation/pages/orders_page.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';
import 'package:goflex/features/profile/presentation/pages/profile_page_new.dart';
import 'package:goflex/features/settings/presentation/pages/settings_page.dart';
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  const SideBar({
    super.key,
    required this.profile,
  });

  final ProfileModel profile;

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  late LoginBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(12.0),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SvgPicture.asset(
                        'assets/icons/profile_placeholder.svg',
                        height: 56,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.profile.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.profile.phone,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black26),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePageNew(
                          profile: widget.profile,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/profile_side.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Профиль',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrdersPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/order_side.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Доставки',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/cart_side.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            'Корзина',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/chat_side.svg'),
                        const SizedBox(width: 8),
                        const Text(
                          'Чат',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    const String phoneNumber = 'tel:+77755205145';
                    try {
                      if (await canLaunch(phoneNumber)) {
                        await launch(phoneNumber);
                      } else {
                        throw 'Could not launch $phoneNumber';
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print('Error: $e');
                      }
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: const Row(
                      children: [
                        Icon(Icons.call_outlined),
                        SizedBox(width: 8),
                        Text(
                          'Call-центр',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/settings_side.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Настройки',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/politics_side.svg'),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Политика конфиденциальности',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Вы уверены?'),
                        content: const Text(
                            'Вы уверены что хотите выйти с аккаунта'),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              bloc.add(UserLogOut());
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPageNew(),
                                  ),
                                  (route) => false);
                            },
                            child: const Text('Да'),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Нет'),
                          )
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Выйти',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/exit_side.svg',
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
