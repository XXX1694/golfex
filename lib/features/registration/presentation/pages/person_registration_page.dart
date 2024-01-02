import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/agreement_page/presentation/pages/agreement_page.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/registration/presentation/bloc/registration_bloc.dart';
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
  late RegistrationBloc bloc;
  @override
  void initState() {
    _fullNameController = TextEditingController();
    _iinController = TextEditingController();
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
                        PersonRegistrationFields(
                          fullNameController: _fullNameController,
                          iinController: _iinController,
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
                                    RegisterUser(
                                      fullName: _fullNameController.text,
                                      iin: _iinController.text,
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
                  ),
                ),
              ],
            ),
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
