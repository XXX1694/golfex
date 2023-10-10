import 'package:flutter/material.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/agreement_main_text.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/agreement_second_text.dart';
import 'package:goflex/features/agreement_page/presentation/widgets/rules_block.dart';
import 'package:goflex/features/common/widgets/main_button.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

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
              MainButton(
                text: 'I agree',
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
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
