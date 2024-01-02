import 'package:flutter/material.dart';

class ParcelCount extends StatefulWidget {
  const ParcelCount({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<ParcelCount> createState() => _ParcelCountState();
}

int number = 1;

class _ParcelCountState extends State<ParcelCount> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Посылка ',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const TextSpan(
                          text: 'x',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '$number',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                number != 1 ? number-- : null;
                widget.controller.text = number.toString();
              });
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: const Center(
                child: Text(
                  '-',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                widget.controller.text = number.toString();
              });
            },
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black26,
                ),
              ),
              child: const Center(
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
