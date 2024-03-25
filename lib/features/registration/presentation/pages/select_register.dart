import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/registration/presentation/pages/person_registration_page.dart';

class SelectRegister extends StatefulWidget {
  const SelectRegister({super.key});

  @override
  State<SelectRegister> createState() => _SelectRegisterState();
}

class _SelectRegisterState extends State<SelectRegister> {
  bool client = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              const Text(
                'Выберете роль',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Далее вы сможете поменять роль в настройках профиля',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    client = true;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: client ? mainColor : Colors.black26,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            'assets/icons/client_image.svg',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: client ? mainColor : Colors.transparent,
                            border: Border.all(
                              color: client ? mainColor : Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/tick.svg',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Человек',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Доставка товара до дома с любой точки города',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Подробнее',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    client = false;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: !client ? mainColor : Colors.black26,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            'assets/icons/shop_image.svg',
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: !client ? mainColor : Colors.transparent,
                            border: Border.all(
                              color: !client ? mainColor : Colors.black26,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/tick.svg',
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 16),
                              Text(
                                'Магазин',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Особые условия с работой офлайн/онлайн магазинами',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Подробнее',
                                style: TextStyle(
                                  color: mainColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              MainButton(
                text: 'Выбрать',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonrRegistrationPage(
                        isClient: client,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
