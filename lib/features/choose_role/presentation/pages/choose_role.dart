// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/choose_role/presentation/widgets/choose_role_bottom_text.dart';
import 'package:goflex/features/choose_role/presentation/widgets/choose_role_main_text.dart';
import 'package:goflex/features/choose_role/presentation/widgets/choose_role_second_text.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/widgets/main_button.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

int i = 0;

class _ChooseRoleState extends State<ChooseRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const ChooseRoleMainText(),
              const SizedBox(height: 16),
              const ChooseRoleSecondText(),
              const SizedBox(height: 16),
              const SizedBox(height: 40),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            i = 1;
                          });
                        },
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: i == 1 ? mainColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: i == 1
                                    ? Colors.transparent
                                    : Colors.black38,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/person.svg',
                                  height: 80,
                                  width: 80,
                                  color: i == 1 ? Colors.white : null,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Физ лицо',
                                  style: TextStyle(
                                    color: i == 1 ? Colors.white : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CupertinoButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          setState(() {
                            i = 2;
                          });
                        },
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: i == 2 ? mainColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: i == 2
                                    ? Colors.transparent
                                    : Colors.black38,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/group.svg',
                                  height: 80,
                                  width: 80,
                                  color: i == 2 ? Colors.white : null,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Юр лицо',
                                  style: TextStyle(
                                    color: i == 2 ? Colors.white : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MainButton(
                text: 'Выбрать',
                onPressed: () {
                  i == 1
                      ? Navigator.pushNamed(context, '/registration/person')
                      : Navigator.pushNamed(
                          context, '/registration/organization');
                },
              ),
              const SizedBox(height: 16),
              const ChooseRoleBottomText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
