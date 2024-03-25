import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:goflex/features/forgot_password/presentation/widgets/password.dart';
import 'package:goflex/features/forgot_password/presentation/widgets/password_repeat.dart';
import 'package:goflex/features/login/presentation/pages/login_page.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({
    super.key,
    required this.email,
    required this.code,
  });
  final String email;
  final String code;
  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  late ForgotPasswordBloc bloc;
  late TextEditingController password;
  late TextEditingController passwordRepeat;
  @override
  void initState() {
    password = TextEditingController();
    passwordRepeat = TextEditingController();
    bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetedPassword) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пароль успешно изменен'),
            ),
          );
        } else if (state is ResetPasswordError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Ошибка, пожалуйста проверьте коректность данных!',
              ),
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
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Придумайте пароль',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                          ),
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
                    const Spacer(flex: 3),
                    PasswordField(controller: password),
                    const SizedBox(height: 20),
                    RepeatPasswordField(controller: passwordRepeat),
                    const Spacer(flex: 2),
                    state is CodeSending
                        ? const MainButtonLoading()
                        : MainButton(
                            text: 'Подтвердить',
                            onPressed: () async {
                              bloc.add(
                                CreatePassword(
                                  email: widget.email,
                                  code: widget.code,
                                  password: password.text,
                                ),
                              );
                            },
                          ),
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
}
