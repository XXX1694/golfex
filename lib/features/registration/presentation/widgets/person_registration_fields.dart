import 'package:flutter/material.dart';
import 'package:goflex/features/registration/presentation/widgets/full_name_field.dart';
import 'package:goflex/features/registration/presentation/widgets/mail_field.dart';
import 'package:goflex/features/registration/presentation/widgets/password_field.dart';
import 'package:goflex/features/registration/presentation/widgets/phone_field.dart';

class PersonRegistrationFields extends StatelessWidget {
  const PersonRegistrationFields({
    super.key,
    required this.fullNameController,
    required this.passwordController,
    required this.phoneNumberController,
    required this.emailController,
  });
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullNameField(controller: fullNameController),
        const SizedBox(height: 20),
        PhoneField(controller: phoneNumberController),
        const SizedBox(height: 20),
        PasswordField(controller: passwordController),
        const SizedBox(height: 20),
        EmailField(controller: emailController),
      ],
    );
  }
}
