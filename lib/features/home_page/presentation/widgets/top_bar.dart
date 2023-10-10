import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/home_page/presentation/widgets/location_bloc.dart';

class HomePageTopBar extends StatelessWidget {
  const HomePageTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Align(
          alignment: Alignment.center,
          child: LocationBlock(),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CupertinoButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              Navigator.pushNamed(context, '/notification');
            },
            child: SvgPicture.asset(
              'assets/icons/ring.svg',
              height: 24,
              width: 24,
            ),
          ),
        )
      ],
    );
  }
}
