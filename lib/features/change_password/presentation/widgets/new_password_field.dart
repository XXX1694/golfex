import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class NewPasswordField extends StatefulWidget {
  const NewPasswordField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<NewPasswordField> createState() => _NewPasswordFieldState();
}

class _NewPasswordFieldState extends State<NewPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      // obscuringCharacter: '*',
      decoration: InputDecoration(
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
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelText: 'Новый пароль',
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
