import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class SelectedPickUTime extends StatefulWidget {
  const SelectedPickUTime({
    super.key,
    required this.courierType,
    required this.deliveryTime,
  });
  final TextEditingController courierType;
  final TextEditingController deliveryTime;
  @override
  State<SelectedPickUTime> createState() => _SelectedPickUTimeState();
}

class _SelectedPickUTimeState extends State<SelectedPickUTime> {
  int selected = 0;
  List<String> availableTimes = [
    '11:00',
    '13:00',
    '15:00',
    '17:00',
  ];
  @override
  Widget build(BuildContext context) {
    widget.courierType.text == 'moto'
        ? availableTimes = [
            '11:00',
            '13:00',
            '15:00',
            '17:00',
          ]
        : availableTimes = [
            '13:00',
          ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'Время забора (До)',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 28,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: availableTimes.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  widget.deliveryTime.text = availableTimes[index];
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 24 : 0,
                    right: 12,
                  ),
                  decoration: BoxDecoration(
                    color: selected == index
                        ? mainColor.withOpacity(0.08)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: Center(
                    child: Text(
                      availableTimes[index],
                      style: TextStyle(
                        color:
                            selected == index ? Colors.black : Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // const SizedBox(height: 8),
        // const Padding(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 24,
        //   ),
        //   child: Text(
        //     '*Заказ будет доставлен в течении 3 часов после забора',
        //     style: TextStyle(
        //       fontSize: 12,
        //       fontWeight: FontWeight.w400,
        //       color: Colors.black54,
        //     ),
        //   ),
        // )
      ],
    );
  }
}
