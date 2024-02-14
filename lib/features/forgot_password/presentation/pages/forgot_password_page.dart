import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResetPasswordPage(),
              ));
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
                const Text(
                  'Пожалуйста, введите свою почту что бы сбросить пароль',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 40),
                EmailField(controller: _emailController),
                const Spacer(),
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
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
