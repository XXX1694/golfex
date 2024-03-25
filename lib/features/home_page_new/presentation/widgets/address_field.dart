import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:goflex/common/colors.dart';

class SelectAddressField extends StatefulWidget {
  const SelectAddressField({
    super.key,
    required this.controller,
    required this.callback,
    required this.refresh,
  });
  final TextEditingController controller;
  final Function(String) callback;
  final Function refresh;
  @override
  State<SelectAddressField> createState() => _SelectAddressFieldState();
}

class _SelectAddressFieldState extends State<SelectAddressField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 5),
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
          ),
          BoxShadow(
            offset: const Offset(-5, -5),
            color: Colors.black.withOpacity(0.05),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              decoration: const InputDecoration(
                hintText: 'Введите адрес',
                floatingLabelStyle: TextStyle(color: mainColor),
                fillColor: Colors.white,
                iconColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintStyle: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                widget.callback(value);
                widget.refresh();
                // placesAutocomplete(value);
              },
              onSubmitted: (value) {
                Navigator.pop(context);
              },
            ),
          ),
          widget.controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    widget.controller.clear();
                  },
                  child: SvgPicture.asset(
                    'assets/icons/cancel.svg',
                    // ignore: deprecated_member_use
                    color: Colors.black54,
                  ),
                )
              : const SizedBox(),
          const SizedBox(width: 8),
          Container(
            height: 32,
            width: 1,
            color: Colors.black12,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 12, right: 4),
              child: Text(
                'Карта',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
