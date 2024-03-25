import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';

class ChooseDeliverMethod extends StatefulWidget {
  const ChooseDeliverMethod({
    super.key,
    required this.controller,
    required this.refresh,
  });
  final TextEditingController controller;
  final Function refresh;
  @override
  State<ChooseDeliverMethod> createState() => _ChooseDeliverMethodState();
}

class _ChooseDeliverMethodState extends State<ChooseDeliverMethod> {
  static List<String> deliveryMethods = [
    'Заказать доставку',
    'Отправить',
  ];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SizedBox(
        height: 28,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: deliveryMethods.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              if (index == 0) {
                widget.controller.text = 'take';
                widget.refresh();
              } else {
                widget.controller.text = 'send';
                widget.refresh();
              }
              setState(() {
                selected = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: selected == index
                    ? mainColor.withOpacity(0.08)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  deliveryMethods[index],
                  style: TextStyle(
                    color: selected == index ? Colors.black : Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
