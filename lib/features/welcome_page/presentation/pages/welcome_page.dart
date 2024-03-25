import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/login/presentation/pages/login_page_new.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/main_text_first.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/main_text_second.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/main_text_third.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_first.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_second.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_third.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

final _storage = SharedPreferences.getInstance();
int index = 0;
List<String> images = [
  'assets/images/1.svg',
  'assets/images/2.svg',
  'assets/images/3.svg',
];

class _WelcomePageState extends State<WelcomePage> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    check();
    super.initState();
  }

  void check() async {
    final storage = await _storage;
    bool? isFirst = storage.getBool('is_first');
    if (isFirst == true) {
      // ignore: use_build_context_synchronously
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPageNew(),
        ),
      );
    }
  }

  void setFirst() async {
    final storage = await _storage;
    storage.setBool('is_first', true);
    // ignore: use_build_context_synchronously
    await Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        elevation: 0,
        leading: index != 0
            ? BackButton(
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    _controller.previousPage(
                      duration: const Duration(microseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  });
                },
              )
            : null,
        actions: [
          CupertinoButton(
            child: const Text(
              'Пропустить',
              style: TextStyle(
                color: mainColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              index = value;
            });
          },
          itemCount: 3,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(
                  height: height * 0.45,
                  child: SvgPicture.asset(images[index]),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (i) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      height: 8,
                      width: index == i ? 24 : 8,
                      decoration: BoxDecoration(
                        color: index == i ? mainColor : mainColor50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                index == 0
                    ? const MainTextFirst()
                    : index == 1
                        ? const MainTextSecond()
                        : const MainTextThird(),
                const SizedBox(height: 20),
                index == 0
                    ? const SecondTextFirst()
                    : index == 1
                        ? const SecondTextSecond()
                        : const SecondTextThird(),
                const SizedBox(height: 40),
                MainButton(
                  text: 'Next',
                  onPressed: () {
                    index != 2
                        ? _controller.nextPage(
                            duration: const Duration(microseconds: 100),
                            curve: Curves.bounceIn,
                          )
                        : setFirst();
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
