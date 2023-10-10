import 'package:flutter/material.dart';
import 'package:goflex/features/common/widgets/main_button.dart';
import 'package:goflex/features/login/presentation/widgets/login_bottom_text.dart';
import 'package:goflex/features/login/presentation/widgets/login_main_text.dart';
import 'package:goflex/features/login/presentation/widgets/login_second_text.dart';
import 'package:goflex/features/login/presentation/widgets/password_field.dart';
import 'package:goflex/features/login/presentation/widgets/phone_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              MainButton(
                text: 'Sign in',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              const LoginBottomText(),
              const SizedBox(height: 20),
            ],
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
