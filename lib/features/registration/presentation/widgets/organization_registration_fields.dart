import 'package:flutter/material.dart';
import 'package:goflex/features/registration/presentation/widgets/bin_field.dart';
import 'package:goflex/features/registration/presentation/widgets/company_name_field.dart';
import 'package:goflex/features/registration/presentation/widgets/password_field.dart';
import 'package:goflex/features/registration/presentation/widgets/phone_field.dart';

class OrganizationRegistrationFields extends StatelessWidget {
  const OrganizationRegistrationFields({
    super.key,
    required this.companyNameController,
    required this.binController,
    required this.passwordController,
    required this.phoneNumberController,
  });
  final TextEditingController binController;
  final TextEditingController companyNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CompanyNameField(controller: companyNameController),
        const SizedBox(height: 20),
        BINField(controller: binController),
        const SizedBox(height: 20),
        PhoneField(controller: phoneNumberController),
        const SizedBox(height: 20),
        PasswordField(controller: passwordController),
      ],
    );
  }
}
