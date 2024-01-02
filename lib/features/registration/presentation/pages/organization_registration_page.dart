import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/agreement_page/presentation/pages/agreement_page.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/registration/presentation/bloc/registration_bloc.dart';
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
  late RegistrationBloc bloc;

  @override
  void initState() {
    _companyNameController = TextEditingController();
    _binController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    bloc = BlocProvider.of<RegistrationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is UserRegistered) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgreementPage(
                phone: _phoneNumberController.text,
                password: _passwordController.text,
              ),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.04),
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
                      SizedBox(height: size.height * 0.04),
                      state is UserRegistering
                          ? const MainButtonLoading()
                          : MainButton(
                              text: 'Зарегистрироваться',
                              onPressed: () {
                                bloc.add(
                                  RegisterOrganization(
                                    organizationName:
                                        _companyNameController.text,
                                    bin: _binController.text,
                                    password: _passwordController.text,
                                    phone: _phoneNumberController.text,
                                  ),
                                );
                              },
                            ),
                      const SizedBox(height: 16),
                      const RegistrationBottomText(),
                      const SizedBox(height: 20),
                    ],
                  ),
                )),
              ],
            ),
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
