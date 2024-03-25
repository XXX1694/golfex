import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/login/presentation/bloc/login_bloc.dart';
import 'package:goflex/features/login/presentation/pages/login_page_new.dart';

class ExitButton extends StatefulWidget {
  const ExitButton({super.key});

  @override
  State<ExitButton> createState() => _ExitButtonState();
}

class _ExitButtonState extends State<ExitButton> {
  late LoginBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bloc.add(UserLogOut());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPageNew(),
            ),
            (route) => false);
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 5),
              blurRadius: 15,
              color: Colors.black12,
            ),
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Column(
                children: [
                  SizedBox(height: 12),
                  Text(
                    'Выйти',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12),
                ],
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
