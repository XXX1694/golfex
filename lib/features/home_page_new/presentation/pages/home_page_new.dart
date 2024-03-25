import 'dart:async';
import 'dart:io';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/cart/data/models/order_model.dart';
import 'package:goflex/features/cart/presentation/pages/cart_page.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/choose_addresses.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/choose_courier_type.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/choose_delivery_method.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/courier_comment.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/home_page_app_bar.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/select_pickup_time.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/side_bar.dart';
import 'package:goflex/features/maps/data/repositories/map_repo.dart';
import 'package:goflex/features/new_order/presentation/bloc/new_order_bloc.dart';
import 'package:goflex/features/profile/data/models/profile_model.dart';
import 'package:goflex/features/profile/presentation/bloc/profile_bloc.dart';

import '../widgets/phone_field.dart';

class HomePageNew extends StatefulWidget {
  const HomePageNew({super.key});

  @override
  State<HomePageNew> createState() => _HomePageNewState();
}

class _HomePageNewState extends State<HomePageNew> {
  late DGisMapController controller;
  final Completer<bool> _isMapReadyCompleter = Completer();
  bool showMore = false;
  bool selectedMap = false;
  bool mapFrom = true;
  late ProfileBloc bloc;
  late NewOrderBloc orderBloc;

  late TextEditingController recipientPhoneController;
  late TextEditingController courierCommentontroller;
  late TextEditingController fromAddress;
  late TextEditingController toAddress;
  late TextEditingController fromLat;
  late TextEditingController fromLng;
  late TextEditingController toLat;
  late TextEditingController toLng;
  late TextEditingController courierType;
  late TextEditingController deliveryType;
  late TextEditingController deliveryTime;

  bool mapReady = false;

  // Offset _offset = Offset.zero;

  // late ScrollController scrollController;

  showMoreFunc() {
    setState(() {
      showMore = true;
      selectedMap = false;
    });
  }

  changeMapFrom(bool to) {
    mapFrom = to;
  }

  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    bloc = BlocProvider.of<ProfileBloc>(context);
    orderBloc = BlocProvider.of<NewOrderBloc>(context);

    bloc.add(GetProfile());
    recipientPhoneController = TextEditingController();
    courierCommentontroller = TextEditingController();
    fromAddress = TextEditingController();
    toAddress = TextEditingController();
    fromLat = TextEditingController();
    fromLng = TextEditingController();
    toLat = TextEditingController();
    toLng = TextEditingController();
    courierType = TextEditingController();
    deliveryType = TextEditingController();
    deliveryTime = TextEditingController();
    courierType.text = 'moto';
    deliveryType.text = 'take';
    // scrollController = ScrollController();
    // scrollController.addListener(() {
    //   scrollListener();
    // });
    super.initState();
  }

  // void scrollListener() {
  //   setState(() {
  //     showMore = scrollController.position.maxScrollExtent > 0;
  //   });
  // }

  @override
  void dispose() {
    recipientPhoneController.dispose();
    courierCommentontroller.dispose();
    fromAddress.dispose();
    toAddress.dispose();
    fromLat.dispose();
    fromLng.dispose();
    toLat.dispose();
    toLng.dispose();
    courierType.dispose();
    deliveryType.dispose();
    // scrollController.removeListener(() {
    //   scrollListener();
    // });
    // scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is GotProfile) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            drawer: SideBar(
              profile: ProfileModel(
                // email: state.profile.email,
                name: state.profile.name,
                phone: state.profile.phone,
                person_type: state.profile.person_type,
              ),
            ),
            body: Stack(
              children: [
                DGIS(),
                const HomePageAppbar(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SafeArea(
                    child: GestureDetector(
                      // onPanDown: (details) {
                      //   setState(() {
                      //     showMore = false;
                      //   });
                      // },
                      onVerticalDragUpdate: (details) {
                        if (details.delta.dy > 0) {
                          setState(() {
                            showMore = false;
                          });
                        }
                        if (details.delta.dy < 0) {
                          setState(() {
                            showMore = true;
                          });
                        }
                      },
                      child: AnimatedContainer(
                        // transform: Matrix4.translationValues(
                        //     _offset.dx, _offset.dy, 0),
                        curve: Curves.ease,
                        duration: const Duration(milliseconds: 200),
                        height: selectedMap
                            ? Platform.isIOS
                                ? MediaQuery.of(context).size.height * 0.10 +
                                    130
                                : MediaQuery.of(context).size.height * 0.13 +
                                    130
                            : showMore
                                ? MediaQuery.of(context).size.height * 0.90
                                : Platform.isIOS
                                    ? MediaQuery.of(context).size.height *
                                            0.30 +
                                        130
                                    : MediaQuery.of(context).size.height *
                                            0.36 +
                                        130,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Center(
                              child: Container(
                                height: 6,
                                width: 42,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            mapReady
                                ? ChooseAddresses(
                                    toController: toAddress,
                                    fromController: fromAddress,
                                    changeMapStatus: changeMapFrom,
                                    fromLat: fromLat,
                                    fromLong: fromLng, toLat: toLat,
                                    toLong: toLng,
                                    mapController: controller,
                                    // mapController: controller,
                                  )
                                : const SizedBox(),
                            Expanded(
                              child: SingleChildScrollView(
                                // controller: scrollController,
                                physics: showMore
                                    ? const AlwaysScrollableScrollPhysics()
                                    : const NeverScrollableScrollPhysics(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    ChooseDeliverMethod(
                                      controller: deliveryType,
                                      refresh: refresh,
                                    ),
                                    ChooseCourierType(
                                      showMore: showMoreFunc,
                                      courierType: courierType,
                                    ),
                                    SelectedPickUTime(
                                      courierType: courierType,
                                      deliveryTime: deliveryTime,
                                    ),
                                    const SizedBox(height: 16),
                                    PhoneField(
                                      controller: recipientPhoneController,
                                      deliveryType: deliveryType,
                                    ),
                                    const SizedBox(height: 20),
                                    CourierComment(
                                      controller: courierCommentontroller,
                                    ),
                                    const SizedBox(height: 100),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // ignore: deprecated_member_use
            bottomSheet: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
                ? null
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(5, 5),
                          color: Colors.black.withOpacity(0.05),
                        ),
                        BoxShadow(
                          blurRadius: 15,
                          offset: const Offset(-5, -5),
                          color: Colors.black.withOpacity(0.05),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        CupertinoButton(
                          onPressed: () async {
                            if (showMore) {
                              bool check = validation(
                                recipientNumber: recipientPhoneController.text,
                                toAddress: toAddress.text,
                                toLat: toLat.text,
                                toLng: toLng.text,
                                fromAddress: fromAddress.text,
                                fromLat: fromLat.text,
                                fromLng: fromLng.text,
                              );
                              if (check) {
                                MapRepository repo = MapRepository();
                                int distance = await repo.calculateDistance(
                                  fromLat: fromLat.text,
                                  fromLong: fromLng.text,
                                  toLat: toLat.text,
                                  toLong: toLng.text,
                                );
                                if (kDebugMode) {
                                  print(123);
                                  print(distance);
                                  print(courierType.text);
                                }

                                orderBloc.add(
                                  AddOrder(
                                    order: OrderModel(
                                      delivery_service: null,
                                      description: courierCommentontroller.text,
                                      from_where: {
                                        'address': fromAddress.text,
                                        'latitude': fromLat.text,
                                        'longitude': fromLng.text
                                      },
                                      product: {
                                        "description":
                                            courierCommentontroller.text,
                                        "amount": 1,
                                        "total_weight_kg": '0',
                                        "width_cm": '0',
                                        "height_cm": '0',
                                        "length_cm": '0',
                                      },
                                      sender: null,
                                      status: null,
                                      term: null,
                                      to_where: {
                                        'address': toAddress.text,
                                        'latitude': toLat.text,
                                        'longitude': toLng.text
                                      },
                                      tracking_number: null,
                                      consumer: recipientPhoneController.text,
                                      price: null,
                                      delivery_date: null,
                                      pickup_date: deliveryTime.text,
                                      pickup_time: deliveryTime.text,
                                      delivery_time: null,
                                      distance: double.parse(
                                          (distance / 1000).toString()),
                                      seller_rate:
                                          courierType.text == 'moto' ? 2 : 1,
                                    ),
                                  ),
                                );
                                setState(() {
                                  recipientPhoneController.text = '';
                                  courierCommentontroller.text = '';
                                  fromAddress.text = '';
                                  toAddress.text = '';
                                  fromLat.text = '';
                                  fromLng.text = '';
                                  toLat.text = '';
                                  toLng.text = '';
                                  showMore = false;
                                });
                              }
                            } else {
                              setState(() {
                                showMore = true;
                                selectedMap = false;
                              });
                            }
                          },
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(12),
                          child: Center(
                            child: BlocConsumer<NewOrderBloc, NewOrderState>(
                              builder: (context, state) {
                                if (state is AddingOrderToCart) {
                                  return Platform.isAndroid
                                      ? const CircularProgressIndicator(
                                          color: mainColor,
                                          strokeWidth: 3,
                                        )
                                      : const CupertinoActivityIndicator(
                                          color: mainColor,
                                        );
                                } else {
                                  return Text(
                                    showMore
                                        ? 'Отправить в корзину'
                                        : 'Подробнее',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }
                              },
                              listener: (context, state) {
                                if (state is AddedOrderToCart) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => CupertinoAlertDialog(
                                      title: const Text('Успех'),
                                      content: const Text(
                                          'Успешно отправлено в коризну'),
                                      actions: [
                                        // CupertinoDialogAction(
                                        //   onPressed: () {
                                        //     Navigator.pop(context);
                                        //   },
                                        //   child: const Text('OK'),
                                        // ),
                                        CupertinoDialogAction(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const CartPage(),
                                              ),
                                            );
                                          },
                                          child: const Text('В Корзину'),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: Platform.isIOS ? 46 : 20)
                      ],
                    ),
                  ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Platform.isAndroid
                  ? const CircularProgressIndicator(
                      color: mainColor,
                      strokeWidth: 3,
                    )
                  : const CupertinoActivityIndicator(
                      color: mainColor,
                    ),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }

  bool validation({
    required String recipientNumber,
    required String toAddress,
    required String toLat,
    required String toLng,
    required String fromAddress,
    required String fromLat,
    required String fromLng,
  }) {
    if (kDebugMode) {
      print(recipientNumber);
      print(toAddress);
      print(toLat);
      print(toLng);
      print(fromAddress);
      print(fromLat);
      print(fromLng);
    }

    if (recipientNumber.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите номер получателя!'),
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
      return false;
    } else if (toAddress.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес доставки!'),
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
      return false;
    } else if (fromAddress.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес отправки!'),
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
      return false;
    } else if (toLat.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес доставки (Lat)!'),
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
      return false;
    } else if (toLat.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес доставки (Lat)!'),
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
      return false;
    } else if (toLng.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес доставки (Long)!'),
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
      return false;
    } else if (fromLat.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес отправки (Lat)!'),
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
      return false;
    } else if (fromLat.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Введите адрес отправки (Long)!'),
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
      return false;
    } else {
      return true;
    }
  }

  // ignore: non_constant_identifier_names
  Widget DGIS() {
    return DGisMap(
      theme: MapTheme.LIGHT,
      token: dgisApi,
      enableUserLocation: true,
      onUserLocationChanged: (position) {
        return Marker(
          position: position,
          icon: "assets/user_location.png",
          iconOptions: const MapIconOptions(size: 40.0),
        );
      },
      initialCameraPosition: CameraPosition(
        position: const Position(
          lat: 43.238949,
          long: 76.889709,
        ),
        zoom: 12,
      ),
      mapOnTap: (position) async {
        setState(() {
          selectedMap = true;
        });
        if (kDebugMode) {
          print('long: ${position.long}');
          print('lat: ${position.lat}');
        }
        MapRepository repo = MapRepository();
        Map<String, dynamic> res = await repo.getAddressByLatLong(
            lat: position.lat.toString(), long: position.long.toString());
        if (res['status'] == 200) {
          if (mapFrom) {
            setState(() {
              fromAddress.text = res['address'];
              fromLat.text = position.lat.toString();
              fromLng.text = position.long.toString();
            });
          } else {
            setState(() {
              toAddress.text = res['address'];
              toLat.text = position.lat.toString();
              toLng.text = position.long.toString();
            });
          }
        }
        controller.moveCamera(
          CameraPosition(position: position, zoom: 18.0),
          duration: const Duration(milliseconds: 400),
          animationType: CameraAnimationType.SHOW_BOTH_POSITIONS,
        );

        controller.markersController.addMarker(
          Marker(
            id: "user_marker",
            position: position,
            icon: "assets/map_pin.png",
          ),
          "user_markers",
        );
      },
      markerOnTap: (marker, _) => controller.moveCamera(
        CameraPosition(
          position: marker.position,
          zoom: 18,
        ),
        duration: const Duration(milliseconds: 600),
      ),
      layers: [
        MapLayer.withClustering(
          builder: (markers) => MapClusterer(
            icon: "assets/map_cluster_pin.png",
            iconOptions: MapIconOptions(
              text: markers.length.toString(),
              textStyle: const MapIconTextStyle(
                fontSize: 13.0,
                color: mainColor,
                strokeColor: mainColor,
                textPlacement: MapIconTextPlacement.TOP_CENTER,
                textOffset: -20.0,
              ),
            ),
          ),
          maxZoom: 20.0,
          minDistance: 100.0,
          onTap: (markers, _) async {
            final cameraPosition = controller.currentCameraPosition;

            final landmark = markers.first;
            controller.moveCamera(
              CameraPosition(
                position: landmark.position,
                zoom: cameraPosition.zoom + 2,
              ),
              duration: const Duration(milliseconds: 300),
              animationType: CameraAnimationType.DEFAULT,
            );
          },
        ),
      ],
      mapOnReady: () {
        _isMapReadyCompleter.complete(true);
        controller.addLayer(const MapLayer(layerId: "user_markers"));
      },
      mapOnCreated: (controller) {
        this.controller = controller;
        setState(() {
          mapReady = true;
        });
      },
    );
  }
}
