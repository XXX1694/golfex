import 'package:flutter/material.dart';

class ImageMock extends StatelessWidget {
  const ImageMock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Image.asset('assets/images/select_source.png'),
    );
  }
}
