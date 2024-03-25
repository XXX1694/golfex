import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/widgets/main_button.dart';
import 'package:goflex/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:goflex/features/forgot_password/presentation/pages/create_password.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({
    super.key,
    required this.email,
  });
  final String email;
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController digit1;
  late TextEditingController digit2;
  late TextEditingController digit3;
  late TextEditingController digit4;
  late TextEditingController digit5;
  late TextEditingController digit6;
  late ForgotPasswordBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<ForgotPasswordBloc>(context);
    digit1 = TextEditingController();
    digit2 = TextEditingController();
    digit3 = TextEditingController();
    digit4 = TextEditingController();
    digit5 = TextEditingController();
    digit6 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              top: 0,
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/icons/background.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: const Center(
                      child: Text(
                        'Введите код',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 3),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit1,
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit2,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit3,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit4,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit5,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                          Container(
                            height: 68,
                            width: 44,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                            child: TextFormField(
                              controller: digit6,
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: '0',
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    state is CodeSending
                        ? const MainButtonLoading()
                        : MainButton(
                            text: 'Подтвердить',
                            onPressed: () async {
                              String codeAll = '';
                              codeAll += digit1.text;
                              codeAll += digit2.text;
                              codeAll += digit3.text;
                              codeAll += digit4.text;
                              codeAll += digit5.text;
                              codeAll += digit6.text;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreatePasswordPage(
                                    email: widget.email,
                                    code: codeAll,
                                  ),
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
