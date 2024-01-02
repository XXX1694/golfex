import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class CommonSizes extends StatefulWidget {
  const CommonSizes({super.key});

  @override
  State<CommonSizes> createState() => _CommonSizesState();
}

int selectedId = -1;

class _CommonSizesState extends State<CommonSizes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Общий размер изделия',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Нажмите на значок, чтобы быстро выбрать вес',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedId != index ? selectedId = index : selectedId = -1;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedId == index ? mainColor : Colors.transparent,
                  ),
                ),
                child: const AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Center(
                    child: Text(
                      'фото',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
