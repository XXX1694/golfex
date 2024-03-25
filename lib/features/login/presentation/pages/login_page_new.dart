import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/forgot_password/presentation/pages/forgot_password_page.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/widgets/login_bottom_text.dart';
import 'package:goflex/features/login/presentation/widgets/password_field.dart';
import 'package:goflex/features/login/presentation/widgets/phone_field.dart';

import '../../../../utils/analytics/app_analytics.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({super.key});

  @override
  State<LoginPageNew> createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  late LoginBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    bloc.add(UserStatus());
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogedIn) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        } else if (state is LogInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('Ошибка при авторизации. Пожалуйста проверьте данные'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/icons/background.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: const Center(
                      child: Text(
                        'goflex',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 54,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 2),
                    PhoneField(controller: _phoneController),
                    const SizedBox(height: 20),
                    PasswordField(controller: _passwordController),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          padding: const EdgeInsets.all(0),
                          child: const Text(
                            'Забыли пароль? ',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Spacer(),
                    state is LogingIn
                        ? const MainButtonLoading()
                        : MainButton(
                            text: 'Войти',
                            onPressed: () async {
                              await AppAnalytics.requestTrackingAuthorization();
                              bloc.add(
                                LogIn(
                                  phoneNumber: _phoneController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 16),
                    const LoginBottomText(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
