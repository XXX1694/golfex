import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class RepeatPasswordField extends StatefulWidget {
  const RepeatPasswordField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<RepeatPasswordField> createState() => RepeatPasswordFieldState();
}

class RepeatPasswordFieldState extends State<RepeatPasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText,
      // obscuringCharacter: '*',
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: mainColor),
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
        labelText: 'Повторите пароль',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: mainColor),
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
