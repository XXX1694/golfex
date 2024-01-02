import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class DestinationInfo extends StatelessWidget {
  const DestinationInfo({
    super.key,
    required this.to,
    required this.phoneNumber,
  });

  final String to;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Информация о пункте назначения',
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
                text: 'До: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: to,
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
