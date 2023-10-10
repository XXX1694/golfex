import 'package:flutter/material.dart';
import 'package:goflex/features/common/widgets/main_button.dart';
import 'package:goflex/features/registration/presentation/widgets/organization_registration_fields.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_bottom_text.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_main_text.dart';
import 'package:goflex/features/registration/presentation/widgets/registration_second_text.dart';

class OrganizationRegistrationPage extends StatefulWidget {
  const OrganizationRegistrationPage({super.key});

  @override
  State<OrganizationRegistrationPage> createState() =>
      _OrganizationRegistrationPageState();
}

class _OrganizationRegistrationPageState
    extends State<OrganizationRegistrationPage> {
  late TextEditingController _binController;
  late TextEditingController _companyNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    _companyNameController = TextEditingController();
    _binController = TextEditingController();
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
              OrganizationRegistrationFields(
                companyNameController: _companyNameController,
                binController: _binController,
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
    _companyNameController.dispose();
    _binController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
