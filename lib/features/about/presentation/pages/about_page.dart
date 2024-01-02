import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'О нас',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.black12,
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  '''Goflex – ваш надежный партнер в сфере логистики в Казахстане, представляющий универсальное мобильное приложение. Мы специализируемся на обслуживании как онлайн, так и офлайн продавцов, предоставляя широкий спектр инструментов для оптимизации вашей логистики.
          
          С приложением Goflex у вас появляется возможность не только рассчитывать точные стоимости доставки, но и эффективно отслеживать перемещение грузов, создавать заказы с легкостью, а также пользоваться множеством других функций, сделанных для удобства и эффективности вашего бизнеса.
          
          Наше приложение станет надежным инструментом для тех, кто стремится к универсальному и современному подходу к управлению логистикой своей компании. Подключайтесь к Goflex – логистика будущего уже здесь.
          ''',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
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
