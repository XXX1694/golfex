import 'package:flutter/material.dart';
import 'package:goflex/features/profile/presentation/widgets/delete_button.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Редактировать профиль',
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 12),
            DeleteButton(),
          ],
        ),
      ),
    );
  }
}
