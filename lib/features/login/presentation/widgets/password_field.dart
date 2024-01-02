import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      // obscuringCharacter: '*',
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(color: mainColor),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            _obscureText = !_obscureText;
          }),
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.black54,
          ),
        ),
        labelText: 'Пароль',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.black26),
        ),
      ),

      keyboardType: TextInputType.visiblePassword,
    );
  }
}
