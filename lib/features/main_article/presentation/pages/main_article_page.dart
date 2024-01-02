import 'package:flutter/material.dart';

class MainArticlePage extends StatelessWidget {
  const MainArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Для продавцов',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(
                  '''Вы ищете надежное решение для доставки, которое обеспечивает как доступность по цене, так и гарантию ответственности за каждый заказ? Смотрите не дальше, чем на Goflex!
          
          - Доступная цена. Мы понимаем важность экономически эффективной логистики для вашего бизнеса в сфере электронной коммерции. С Goflex вы можете наслаждаться конкурентоспособными ценами, которые не скажутся на вашей прибыли. Независимо от того, отправляете ли вы мелкие товары или большие посылки, мы учитываем ваш бюджет.
          
          - Наша ответственность. В Goflex мы несем полную ответственность за каждый заказ. Ваши товары являются нашим приоритетом. Мы относимся к каждой отправке с особой тщательностью, гарантируя, что они дойдут до ваших клиентов в отличном состоянии. Наше обязательство - ваше спокойствие.
          
          Присоединяйтесь к Goflex и увеличьте успех вашего интернет-магазина с помощью наших доступных и ответственных служб доставки. Ваши клиенты будут вам благодарны!
          ''',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
