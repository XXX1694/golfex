import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:goflex/features/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:goflex/features/registration/presentation/widgets/mail_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _emailController;
  late ForgotPasswordBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is CodeSended) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Код отправлен'),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                email: _emailController.text,
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
                      child: Text(
                        'Восстановить Пароль',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
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
                    const Spacer(flex: 3),
                    EmailField(controller: _emailController),
                    const SizedBox(height: 16),
                    const Text(
                      '* На эту почту будет отправлен код',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(flex: 2),
                    state is CodeSending
                        ? const MainButtonLoading()
                        : MainButton(
                            text: 'Отправить код',
                            onPressed: () async {
                              bloc.add(SendCode(email: _emailController.text));
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

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
