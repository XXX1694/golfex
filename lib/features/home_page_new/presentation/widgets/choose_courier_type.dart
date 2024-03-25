import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseCourierType extends StatefulWidget {
  const ChooseCourierType({
    super.key,
    required this.showMore,
    required this.courierType,
  });
  final Function showMore;
  final TextEditingController courierType;
  @override
  State<ChooseCourierType> createState() => _ChooseCourierTypeState();
}

class _ChooseCourierTypeState extends State<ChooseCourierType> {
  int selected = 0;
  List<Map<String, dynamic>> courierType = [
    {
      'name': 'Мото-курьер',
      'img': 'assets/icons/moto.svg',
      'initial_price': '1000',
      'price_for_km': '80',
    },
    {
      'name': 'Авто-курьер',
      'img': 'assets/icons/car.svg',
      'initial_price': '2500',
      'price_for_km': '100',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 139,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 20,
        ),
        itemCount: courierType.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (index == 0) {
              widget.courierType.text = 'moto';
            } else {
              widget.courierType.text = 'auto';
            }
            setState(() {
              selected = index;
            });
            widget.showMore();
          },
          child: Opacity(
            opacity: index == selected ? 1 : 0.54,
            child: Container(
              width: 170,
              margin: EdgeInsets.only(
                  right: index == courierType.length - 1 ? 24 : 12,
                  left: index == 0 ? 24 : 0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: selected == index ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  selected == index
                      ? BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(5, 5),
                          color: Colors.black.withOpacity(0.05),
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                        ),
                  selected == index
                      ? BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(-5, -5),
                          color: Colors.black.withOpacity(0.05),
                        )
                      : const BoxShadow(
                          color: Colors.transparent,
                        ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        courierType[index]['img'],
                        height: 30,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset(
                          'assets/icons/info.svg',
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    courierType[index]['name'],
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: courierType[index]['initial_price'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' (+₸${courierType[index]['price_for_km']}/км)',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
