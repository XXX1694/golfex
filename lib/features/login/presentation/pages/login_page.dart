import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/widgets/login_bottom_text.dart';
import 'package:goflex/features/login/presentation/widgets/login_main_text.dart';
import 'package:goflex/features/login/presentation/widgets/login_second_text.dart';
import 'package:goflex/features/login/presentation/widgets/password_field.dart';
import 'package:goflex/features/login/presentation/widgets/phone_field.dart';

import '../../../../utils/analytics/app_analytics.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          // showDialog(
          //   context: context,
          //   builder: (context) => AlertDialog(
          //     title: const Text('Местоположение'),
          //     content: const Text(
          //         'Чтобы обеспечивать работу выбора адреса доставки и отправки это приложение собирает данные о местоположении, даже когда закрыто или не используется'),
          //     actions: [
          //       TextButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Да'),
          //       ),
          //       TextButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          //         child: const Text('Нет'),
          //       ),
          //     ],
          //   ),
          // );
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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const LoginMainText(),
                const SizedBox(height: 16),
                const LoginSecondText(),
                const SizedBox(height: 40),
                PhoneField(controller: _phoneController),
                const SizedBox(height: 20),
                PasswordField(controller: _passwordController),
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
