import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';

class ProfileMainPart extends StatelessWidget {
  const ProfileMainPart({super.key, required this.profile});
  final ProfileModel profile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          profile.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        profile.person_type == 'client'
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/client_icon.svg'),
                  const SizedBox(width: 4),
                  const Text(
                    'Клиент',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/shop_icon.svg'),
                  const SizedBox(width: 4),
                  const Text(
                    'Магазин',
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
        const SizedBox(height: 20),
        profile.person_type != 'client'
            ? Row(
                children: [
                  const Text(
                    'Имя магазина:',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    profile.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
            : const SizedBox(),
        const SizedBox(height: 12),
        Row(
          children: [
            const Text(
              'Номер:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            Text(
              profile.phone,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        const Row(
          children: [
            Text(
              'Почта:',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ],
    );
  }
}
