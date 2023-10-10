import 'package:flutter/material.dart';
import 'package:goflex/features/common/widgets/main_button.dart';
import 'package:goflex/features/registration/presentation/widgets/person_registration_fields.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_bottom_text.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_main_text.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_second_text.dart';

class PersonrRegistrationPage extends StatefulWidget {
  const PersonrRegistrationPage({super.key});

  @override
  State<PersonrRegistrationPage> createState() =>
      _PersonrRegistrationPageState();
}

class _PersonrRegistrationPageState extends State<PersonrRegistrationPage> {
  late TextEditingController _iinController;
  late TextEditingController _fullNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _fullNameController = TextEditingController();
    _iinController = TextEditingController();
    _phoneNumberController = TextEditingController();
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
              const Spacer(flex: 2),
              const RegistrationMainText(),
              const SizedBox(height: 16),
              const RegistrationSecondText(),
              const SizedBox(height: 40),
              PersonRegistrationFields(
                fullNameController: _fullNameController,
                iinController: _iinController,
                passwordController: _passwordController,
                phoneNumberController: _phoneNumberController,
              ),
              const Spacer(flex: 1),
              MainButton(
                text: 'Register Now',
                onPressed: () {
                  Navigator.pushNamed(context, '/agreement');
                },
              ),
              const SizedBox(height: 16),
              const RegistrationBottomText(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _iinController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
