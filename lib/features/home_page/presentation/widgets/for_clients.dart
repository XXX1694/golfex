import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/client_map/presentation/pages/client_map.dart';

class ForClientsButton extends StatelessWidget {
  const ForClientsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0XFF222222),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Text(
                'Для клиентов',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Новый заказ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: mainColor,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/arrow_right.svg',
                        height: 10,
                        width: 10,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ClientMapPageDGis(),
          ),
        );
      },
    );
  }
}
