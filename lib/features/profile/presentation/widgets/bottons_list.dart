import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/change_password/presentation/pages/change_password_page.dart';
import 'package:goflex/features/edit_profile/presentation/pages/edit_profile_page.dart';
import 'package:goflex/features/orders/presentation/pages/orders_page.dart';

class ButtonsList extends StatelessWidget {
  const ButtonsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) => CupertinoAlertDialog(
            //     title: const Text('Ошибка'),
            //     content: const Text('Временно недоступен'),
            //     actions: [
            //       CupertinoDialogAction(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: const Text('OK'),
            //       )
            //     ],
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditProfilePage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/edit_icon.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Редактировать профиль',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
        GestureDetector(
          onTap: () {
            // showDialog(
            //   context: context,
            //   builder: (context) => CupertinoAlertDialog(
            //     title: const Text('Ошибка'),
            //     content: const Text('Временно недоступен'),
            //     actions: [
            //       CupertinoDialogAction(
            //         onPressed: () {
            //           Navigator.pop(context);
            //         },
            //         child: const Text('OK'),
            //       )
            //     ],
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangePasswordPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/password_icon.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Сменить пароль',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const OrdersPage(),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/order_side.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'История заказов',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Ошибка'),
                content: const Text('Временно недоступен'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/express_icon.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Экспресс-доставка',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Ошибка'),
                content: const Text('Временно недоступен'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/card_icon.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Мои карты',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('Ошибка'),
                content: const Text('Временно недоступен'),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  )
                ],
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/address_icon.svg',
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Мои адреса',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12, height: 1),
      ],
    );
  }
}
