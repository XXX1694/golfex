// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          'Помощь',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              CupertinoButton(
                child: const Text(
                  'Часто задаваемые вопросы',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Пока не доступно'),
                    ),
                  );
                },
              ),
              const Divider(),
              CupertinoButton(
                child: const Text(
                  'Написать нам (Telegram)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onPressed: () async {
                  try {
                    const String url = 'https://t.me/tutkabayeva';

                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch Telegram';
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print('Error: $e');
                    }
                  }
                },
              ),
              const Divider(),
              CupertinoButton(
                child: const Text(
                  'Позвонить',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                onPressed: () async {
                  const String phoneNumber = 'tel:+77079151503';
                  try {
                    if (await canLaunch(phoneNumber)) {
                      await launch(phoneNumber);
                    } else {
                      throw 'Could not launch $phoneNumber';
                    }
                  } catch (e) {
                    if (kDebugMode) {
                      print('Error: $e');
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
