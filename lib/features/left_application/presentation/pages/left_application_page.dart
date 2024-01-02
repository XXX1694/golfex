import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/left_application/presentation/bloc/left_application_bloc.dart';
import 'package:goflex/features/new_order/presentation/widgets/contact_info_page/recipient_number_field.dart';
import 'package:goflex/features/registration/presentation/widgets/full_name_field.dart';

class LeftApplicationPage extends StatefulWidget {
  const LeftApplicationPage({super.key});

  @override
  State<LeftApplicationPage> createState() => _LeftApplicationPageState();
}

class _LeftApplicationPageState extends State<LeftApplicationPage> {
  late TextEditingController _phoneController;
  late TextEditingController _nameController;
  late LeftApplicationBloc bloc;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _nameController = TextEditingController();
    bloc = BlocProvider.of<LeftApplicationBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeftApplicationBloc, LeftApplicationState>(
      listener: (context, state) {
        if (state is ApplicationLefted) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Заявка отправлено'),
            ),
          );
        } else if (state is ApplicationLeftError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ошибка, проверьте данные'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: const Color(0xFF222222),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF222222),
          elevation: 0,
          title: const Text(
            'Стать партнёром',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const Text(
                          'Оставить заявку',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 30),
                        FullNameField(controller: _nameController),
                        const SizedBox(height: 20),
                        RecipientNumberField(controller: _phoneController),
                        const Spacer(),
                        state is ApplicationLefting
                            ? const MainButtonLoading()
                            : MainButton(
                                text: 'Оставить заявку',
                                onPressed: () {
                                  if (_phoneController.text.length != 18 &&
                                      _nameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Пожалуйста заполните все поля'),
                                      ),
                                    );
                                  } else if (_phoneController.text.length !=
                                      18) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Требуеться номер телефона'),
                                      ),
                                    );
                                  } else if (_nameController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Требуеться ваше имя'),
                                      ),
                                    );
                                  } else {
                                    bloc.add(
                                      LeftApplication(
                                        name: _nameController.text,
                                        phone: formatPhoneNumber(
                                            _phoneController.text),
                                      ),
                                    );
                                  }
                                },
                              ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}

String formatPhoneNumber(String input) {
  // Remove all non-numeric characters from the input string
  String numericString = input.replaceAll(RegExp(r'[^\d]+'), '');

  // Check if the numeric string starts with a plus sign
  if (numericString.startsWith('+')) {
    return numericString;
  } else {
    // If not, add a plus sign at the beginning
    return '+$numericString';
  }
}
