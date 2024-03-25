import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/notification/presentation/pages/notification_page.dart';

class HomePageAppbar extends StatelessWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: SvgPicture.asset('assets/icons/burger.svg'),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Expanded(
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'go',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'flex',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: SvgPicture.asset('assets/icons/ring_black.svg'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
