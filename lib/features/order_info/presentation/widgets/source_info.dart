import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class SourceInfo extends StatelessWidget {
  const SourceInfo({
    super.key,
    required this.from,
    required this.phoneNumber,
  });

  final String from;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Информация об источнике',
          style: TextStyle(
            color: mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Divider(color: Colors.black26),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'От: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: from,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // TextSpan(
              //   text: '($lat, $lng)',
              //   style: const TextStyle(
              //     color: Colors.black54,
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Номер телефона: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: phoneNumber,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
