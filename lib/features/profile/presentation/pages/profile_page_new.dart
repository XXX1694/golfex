import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';
import 'package:goflex/features/profile/presentation/widgets/bottons_list.dart';
import 'package:goflex/features/profile/presentation/widgets/profile_main_part.dart';

class ProfilePageNew extends StatefulWidget {
  const ProfilePageNew({
    super.key,
    required this.profile,
  });
  final ProfileModel profile;
  @override
  State<ProfilePageNew> createState() => _ProfilePageNewState();
}

class _ProfilePageNewState extends State<ProfilePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: mainColor20,
      //   elevation: 0,
      // ),
      body: Stack(
        children: [
          Container(
            color: mainColor20,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                SvgPicture.asset(
                  'assets/icons/profile_placeholder_dark.svg',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 24),
                ProfileMainPart(
                  profile: widget.profile,
                ),
                const SizedBox(height: 32),
                const Divider(color: Colors.black12, height: 1),
                // const SizedBox(height: 8),
                const ButtonsList(),
                const Spacer(),
              ],
            ),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: BackButton(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
