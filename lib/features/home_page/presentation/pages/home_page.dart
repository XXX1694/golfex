import 'package:flutter/material.dart';
import 'package:goflex/features/home_page/presentation/widgets/create_order_button.dart';
import 'package:goflex/features/home_page/presentation/widgets/for_clients.dart';
import 'package:goflex/features/home_page/presentation/widgets/left_application_button.dart';
import 'package:goflex/features/home_page/presentation/widgets/home_page_main_text.dart';
import 'package:goflex/features/home_page/presentation/widgets/home_page_second_text.dart';
import 'package:goflex/features/home_page/presentation/widgets/shipment_code_field.dart';
import 'package:goflex/features/home_page/presentation/widgets/top_bar.dart';
import 'package:goflex/features/home_page/presentation/widgets/work_with_marketplace_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0XFF222222),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              const HomePageTopBar(),
              const SizedBox(height: 32),
              const HomePageMainText(),
              const SizedBox(height: 8),
              const HomePageSecondText(),
              const SizedBox(height: 24),
              const ShipmentCodeField(),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Expanded(
                                flex: 6,
                                child: ForClientsButton(),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                flex: 7,
                                child: WorkWithMarketplaceButton(),
                              ),
                              SizedBox(height: 40),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 60),
                              Expanded(
                                flex: 7,
                                child: LeftApplicationButton(),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                flex: 5,
                                child: CreateOrderButton(),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
