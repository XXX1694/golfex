import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';

class ParcelType extends StatefulWidget {
  const ParcelType({super.key});

  @override
  State<ParcelType> createState() => _ParcelTypeState();
}

bool isHuge = false;

class _ParcelTypeState extends State<ParcelType> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 236,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHuge = false;
                    });
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isHuge ? Colors.transparent : mainColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/images/small_parcel.svg',
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Небольшая посылка',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHuge = true;
                    });
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: !isHuge ? Colors.transparent : mainColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            'assets/images/huge_parcel.svg',
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Огромная посылка',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
