import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/order_info/presentation/pages/order_info_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);

  int all = 0;
  int res = 0;
  late CartBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<CartBloc>(context);
    bloc.add(GetCart());
    super.initState();
  }

  void _onRefresh() async {
    // monitor network fetch
    all = 0;
    res = 0;
    bloc.add(GetCart());
    await Future.delayed(const Duration(milliseconds: 1000));

    refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // bloc.add(GetCart());
    // await Future.delayed(const Duration(milliseconds: 500));
    // if (mounted) setState(() {});
    // refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is CartGot) {
          all = 0;
          res = 0;
          for (int i = 0; i < state.orders.length; i++) {
            all += state.orders[i].price ?? 0;
          }
          if (state.orders.length <= 2) {
            all == 500;
          }
        } else if (state is OrderSended) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Отправлено на обработку'),
            ),
          );
        } else if (state is OrderSendError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ошибка при отправке на обработку'),
            ),
          );
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Корзина',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
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
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Expanded(
                      child: SmartRefresher(
                        header: CustomHeader(
                          builder: (context, mode) => Platform.isAndroid
                              ? const CircularProgressIndicator(
                                  color: mainColor,
                                  strokeWidth: 3,
                                )
                              : const CupertinoActivityIndicator(
                                  color: mainColor,
                                ),
                        ),
                        enablePullDown: true,
                        enablePullUp: false,
                        controller: refreshController,
                        onRefresh: _onRefresh,
                        onLoading: _onLoading,
                        child: state is CartGot
                            ? ListView.builder(
                                itemCount: state.orders.length,
                                itemBuilder: (context, index) => Padding(
                                  padding: index == 0
                                      ? const EdgeInsets.symmetric(vertical: 20)
                                      : const EdgeInsets.only(bottom: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OrderInfoPage(
                                            tracking_number: state.orders[index]
                                                    .tracking_number ??
                                                '',
                                            delete: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 16, 20, 16),
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black26),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.orders[index].status ?? '',
                                            style: const TextStyle(
                                              color: mainColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Получатель: ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: state
                                                      .orders[index].consumer
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'От: ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: state.orders[index]
                                                      .from_where?['address'],
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'До: ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: state.orders[index]
                                                      .to_where?['address'],
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                const TextSpan(
                                                  text: 'Цена: ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                // TextSpan(
                                                //   text:
                                                //       '${state.orders.length <= 2 ? state.orders[index].price : ''}',
                                                //   style: const TextStyle(
                                                //     decoration: TextDecoration
                                                //         .lineThrough,
                                                //     color: mainColor,
                                                //     fontSize: 16,
                                                //     fontWeight: FontWeight.w600,
                                                //   ),
                                                // ),
                                                TextSpan(
                                                  text:
                                                      ' ${state.orders.length <= 2 ? (state.orders.length == 1 ? state.orders[index].price : state.orders[index].price) : state.orders[index].price}',
                                                  style: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : state is CartGetting
                                ? Center(
                                    child: Platform.isAndroid
                                        ? const CircularProgressIndicator(
                                            color: mainColor,
                                            strokeWidth: 3,
                                          )
                                        : const CupertinoActivityIndicator(
                                            color: mainColor,
                                          ),
                                  )
                                : const Center(
                                    child: Text('Пусто'),
                                  ),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Column(
                children: [
                  const Spacer(),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: mainColor20,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Итого: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '$all',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              state is CartGot ? 'Забор: ' : '',
                              style: const TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '${state is CartGot ? state.orders.length <= 2 ? 500 : 'Бесплатно' : ''}',
                              style: const TextStyle(
                                color: mainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      if (state is CartGetError) {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ContactInfoPage(),
                        //   ),
                        // );
                        showDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text('Ошибка'),
                            content: const Text('Корзина пуста'),
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
                      } else {
                        bloc.add(SendOrders());
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: mainColor,
                      child: const Center(
                        child: Text(
                          'Отправить все',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
