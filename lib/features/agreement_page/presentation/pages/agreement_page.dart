import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/agreement_main_text.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/agreement_second_text.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/rules_block.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({
    super.key,
    required this.phone,
    required this.password,
  });
  final String phone;
  final String password;

  @override
  State<AgreementPage> createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  late LoginBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LogingIn) {
          Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AgreementMainText(),
                      SizedBox(height: 8),
                      AgreementSecondText(),
                      SizedBox(height: 28),
                      RulesBlock(),
                    ],
                  ),
                ),
                const Spacer(),
                state is LogingIn
                    ? const MainButtonLoading()
                    : MainButton(
                        text: 'Я согласен',
                        onPressed: () {
                          bloc.add(
                            LogIn(
                                phoneNumber: widget.phone,
                                password: widget.password),
                          );
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
}
