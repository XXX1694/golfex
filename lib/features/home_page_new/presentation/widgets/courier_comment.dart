import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class CourierComment extends StatelessWidget {
  const CourierComment({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Комментарий курьеру',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            maxLines: 3,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              hintText: 'Осторожно стекло, вход слева ...',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: mainColor20,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
