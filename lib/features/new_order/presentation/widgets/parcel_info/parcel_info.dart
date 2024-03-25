import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ParcelInfo extends StatelessWidget {
  const ParcelInfo({
    super.key,
    required this.weight,
    required this.count,
    required this.description,
    required this.height,
    required this.length,
    required this.width,
  });
  final String weight;
  final String height;
  final String width;
  final String length;
  final String count;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Информация о посылке',
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
                text: 'Вес: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: weight.isEmpty ? 'пусто' : '${weight}kg',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Размер: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: width.isEmpty && length.isEmpty && height.isEmpty
                    ? 'пусто'
                    : '',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: width.isEmpty ? '' : '${width}cm ',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: height.isEmpty ? '' : 'x ${height}cm ',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: length.isEmpty ? '' : 'x ${length}cm',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Количество: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: count.isEmpty ? 'пусто' : '$count шт',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Описание: ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: description.isEmpty ? 'пусто' : description,
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
