import 'package:flutter/material.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/new_order/presentation/pages/select_source_page.dart';
import 'package:goflex/features/new_order/presentation/widgets/contact_info_page/recipient_number_field.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  late TextEditingController _phoneController;
  @override
  void initState() {
    _phoneController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF222222),
        elevation: 0,
        title: const Text(
          'Новый заказ',
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
                        'Контактная информация',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      RecipientNumberField(controller: _phoneController),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            ' Введите номер получателя',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const Spacer(),
                      MainButton(
                        text: 'Далее',
                        onPressed: () {
                          if (_phoneController.text.length == 18) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectSourcePage(
                                  phoneNumber: _phoneController.text,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Заполните контактную информацию'),
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
    );
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }
}
