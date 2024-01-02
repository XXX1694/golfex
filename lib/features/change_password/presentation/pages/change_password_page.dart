import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/change_password/presentation/bloc/change_password_bloc.dart';
import 'package:goflex/features/change_password/presentation/widgets/new_password_field.dart';
import 'package:goflex/features/change_password/presentation/widgets/old_password_field.dart';
import 'package:goflex/common/widgets/main_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  late TextEditingController newPasswordController;
  late TextEditingController oldPasswordController;
  late ChangePasswordBloc bloc;
  @override
  void initState() {
    newPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    bloc = BlocProvider.of<ChangePasswordBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        if (state is PasswordChanged) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пароль был успешно изменен!'),
            ),
          );
        } else if (state is PasswordChangeError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('К сожалению пароль не был изменен!'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text(
            'Сменить пароль',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Colors.black12,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 28),
                OldPasswordField(controller: oldPasswordController),
                const SizedBox(height: 20),
                NewPasswordField(controller: newPasswordController),
                const Spacer(),
                state is PasswordChanging
                    ? const MainButtonLoading()
                    : MainButton(
                        text: 'Поменять',
                        onPressed: () {
                          if (newPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Придумайте новый пароль'),
                              ),
                            );
                          } else if (newPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Введите новый пароль'),
                              ),
                            );
                          } else {
                            if (newPasswordController.text.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Пароль должен содержать минимум 6 символов'),
                                ),
                              );
                            } else {
                              bloc.add(
                                ChangePassword(
                                  newPassword: newPasswordController.text,
                                  oldPassword: oldPasswordController.text,
                                ),
                              );
                            }
                          }
                        },
                      ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }
}
