import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Параметры',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Ошибка'),
                      content: const Text('Временно недоступен'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Поменять тему',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black12,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Ошибка'),
                      content: const Text('Временно недоступен'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        )
                      ],
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Сменить язык',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 1,
                color: Colors.black12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
