import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goflex/features/common/colors.dart';
import 'package:goflex/features/common/widgets/main_button.dart';

import 'package:goflex/features/welcome_page/presentation/widgets/main_text_first.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/main_text_second.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/main_text_third.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_first.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_second.dart';
import 'package:goflex/features/welcome_page/presentation/widgets/second_text_third.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

int index = 0;

class _WelcomePageState extends State<WelcomePage> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
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
            child: Text(
              'Skip',
              style: GoogleFonts.montserrat(
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
                Container(
                  decoration: BoxDecoration(
                    color: mainColor20,
                  ),
                  height: height * 0.45,
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
                        : Navigator.pushNamed(context, '/login');
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
