import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';

class CommonSizes extends StatefulWidget {
  const CommonSizes({
    super.key,
    required this.height,
    required this.length,
    required this.width,
  });
  final TextEditingController height;
  final TextEditingController length;
  final TextEditingController width;
  @override
  State<CommonSizes> createState() => _CommonSizesState();
}

int selectedId = -1;

List<String> images = [
  'assets/icons/s.svg',
  'assets/icons/m.svg',
  'assets/icons/l.svg',
  'assets/icons/xl.svg',
];

List<String> images1 = [
  'assets/icons/s_1.svg',
  'assets/icons/m_1.svg',
  'assets/icons/l_1.svg',
  'assets/icons/xl_1.svg',
];

List<String> sizes = [
  '36x17x8',
  '30x20x15',
  '40x27x18',
  '50x36x22',
];

class _CommonSizesState extends State<CommonSizes> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Общий размер посылки',
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
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedId != index ? selectedId = index : selectedId = -1;
                  if (selectedId == 0) {
                    widget.height.text = '36';
                    widget.length.text = '8';
                    widget.width.text = '17';
                  }
                  if (selectedId == 1) {
                    widget.height.text = '30';
                    widget.length.text = '15';
                    widget.width.text = '20';
                  }
                  if (selectedId == 2) {
                    widget.height.text = '40';
                    widget.length.text = '18';
                    widget.width.text = '27';
                  }
                  if (selectedId == 3) {
                    widget.height.text = '50';
                    widget.length.text = '22';
                    widget.width.text = '36';
                  }
                });
              },
              child: Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  color: selectedId == index
                      ? mainColor
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedId == index ? mainColor : Colors.transparent,
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        selectedId == index
                            ? SvgPicture.asset(
                                images1[index],
                                height: 60,
                                width: 60,
                              )
                            : SvgPicture.asset(
                                images[index],
                                height: 52,
                                width: 52,
                              ),
                        selectedId == index
                            ? const SizedBox(height: 0)
                            : const SizedBox(height: 8),
                        Text(
                          sizes[index],
                          style: TextStyle(
                            color: selectedId == index
                                ? Colors.white
                                : Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
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
