import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/pages/login_page_new.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({super.key});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  late LoginBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginDeleted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPageNew(),
              ),
              (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Аккаунт успешно удален'),
            ),
          );
        }
      },
      builder: (context, state) => GestureDetector(
        onTap: () {
          bloc.add(UserDelete());
        },
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Удалить аккаунт',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
