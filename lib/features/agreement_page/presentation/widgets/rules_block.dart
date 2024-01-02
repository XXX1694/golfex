import 'package:flutter/material.dart';

class RulesBlock extends StatelessWidget {
  const RulesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainText('Укажите точный адрес.', size),
        const SizedBox(height: 4),
        secondText(
            'Всегда следите за тем, чтобы вы вводили правильный адрес доставки, чтобы избежать задержек или неправильной доставки.',
            size),
        const SizedBox(height: 12),
        mainText('Будьте внимательны и терпеливы.', size),
        const SizedBox(height: 4),
        secondText(
            'Будьте готовы получить свой заказ, когда приедет водитель, и проявите терпение, так как сроки доставки могут варьироваться.',
            size),
        const SizedBox(height: 12),
        mainText('Проверь заказ', size),
        const SizedBox(height: 4),
        secondText(
            'Тщательно проверьте ваш заказ, чтобы убедиться в его точности и полноте, прежде чем принимать его от водителя доставки.',
            size),
        const SizedBox(height: 12),
        mainText('Местоположение', size),
        const SizedBox(height: 4),
        secondText(
            'Чтобы обеспечивать работу выбора адреса доставки и отправки это приложение собирает данные о местоположении, даже когда закрыто или не используется',
            size),
      ],
    );
  }
}

Widget mainText(String txt, Size size) {
  return Text(
    txt,
    style: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      height: 22 / size.height * 70,
    ),
  );
}

Widget secondText(String txt, Size size) {
  return Text(
    txt,
    style: TextStyle(
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 22 / size.height * 70,
    ),
  );
}
