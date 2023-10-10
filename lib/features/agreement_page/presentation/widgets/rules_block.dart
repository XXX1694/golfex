import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesBlock extends StatelessWidget {
  const RulesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainText('Provide Accurate Address.', size),
        const SizedBox(height: 4),
        secondText(
            'Always ensure you enter the correct delivery address to avoid delays or misdeliveries.',
            size),
        const SizedBox(height: 12),
        mainText('Be Prompt & Patient.', size),
        const SizedBox(height: 4),
        secondText(
            'Be ready to receive your order when the driver arrives, and exercise patience, as delivery times may vary.',
            size),
        const SizedBox(height: 12),
        mainText('Check Your Order', size),
        const SizedBox(height: 4),
        secondText(
            'Thoroughly inspect your order to ensure it\'s accurate and complete before accepting it from the delivery driver.',
            size),
        const SizedBox(height: 12),
        mainText('Tip Generously.', size),
        const SizedBox(height: 4),
        secondText(
            'Show appreciation for the delivery service by tipping your driver appropriately for their time and effort.',
            size),
      ],
    );
  }
}

Widget mainText(String txt, Size size) {
  return Text(
    txt,
    style: GoogleFonts.montserrat(
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
    style: GoogleFonts.montserrat(
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 22 / size.height * 70,
    ),
  );
}
