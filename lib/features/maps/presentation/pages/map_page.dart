import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/maps/data/models/autocomplete_predictions.dart';
import 'package:goflex/features/maps/data/models/places_autocomplete.dart';
import 'package:goflex/utils/network_utility.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    required this.controller,
    required this.callback,
    required this.lat,
    required this.lng,
  });
  final Function(String, double, double) callback;
  final TextEditingController controller;
  final TextEditingController lng;
  final TextEditingController lat;
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? destLocation = const LatLng(43.238949, 76.889709);
  List<AutocompletePrediction> placesPredictions = [];
  Location location = Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();
  String? address;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: destLocation!,
                zoom: 16,
              ),
              onCameraMove: (CameraPosition? position) {
                if (destLocation != position!.target) {
                  setState(() {
                    destLocation = position.target;
                  });
                }
              },
              onCameraIdle: () {
                if (kDebugMode) {
                  print('Camera Idle');
                }
              },
              onTap: (latlng) {
                if (placesPredictions.isEmpty) {
                  getAddressFromLatLng();
                }
                setState(() {
                  placesPredictions.clear();
                });
              },
              onMapCreated: (GoogleMapController controller) {
                _mapController.complete(controller);
              },
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: SvgPicture.asset(
                  'assets/icons/map_marker.svg',
                  height: 28,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xFF222222),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: widget.controller,
                                    decoration: InputDecoration(
                                      hintText: 'Введите адрес',
                                      floatingLabelStyle:
                                          TextStyle(color: mainColor),
                                      fillColor: Colors.white,
                                      iconColor: Colors.white,
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      hintStyle: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      placesAutocomplete(value);
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    widget.callback(
                                      '',
                                      0,
                                      0,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(width: 12),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          placesPredictions.isEmpty
                              ? const SizedBox()
                              : Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ListView.builder(
                                    itemCount: placesPredictions.length,
                                    itemBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: GestureDetector(
                                        onTap: () {
                                          widget.controller.text =
                                              placesPredictions[index]
                                                      .description ??
                                                  '';
                                          setState(() {
                                            getLatLngById();
                                          });
                                        },
                                        child: Text(
                                          placesPredictions[index]
                                                  .description ??
                                              '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Positioned(
            //   // top: 20,
            //   right: 20,
            //   left: 20,
            //   bottom: 20,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       border: Border.all(
            //         color: Colors.black,
            //       ),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     padding: const EdgeInsets.all(20),
            //     child: Text(
            //       address ?? 'Выберите место на карте',
            //       overflow: TextOverflow.visible,
            //       softWrap: true,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  void placesAutocomplete(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        "input": "$query Алматы",
        "language": "ru",
        "key": 'AIzaSyBK8UODiBnpgbTS_0AaJIHMuo3gcmXfw-Y',
      },
    );
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      if (kDebugMode) {
        print(response);
      }
      PlacesAutocompleteResponse result =
          PlacesAutocompleteResponse.parseAutoCompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placesPredictions = result.predictions!;
        });
      }
    }
  }

  getAddressFromLatLng() async {
    try {
      GeoData data = await Geocoder2.getDataFromCoordinates(
        latitude: destLocation!.latitude,
        longitude: destLocation!.longitude,
        googleMapApiKey: 'AIzaSyBK8UODiBnpgbTS_0AaJIHMuo3gcmXfw-Y',
      );
      setState(() {
        widget.controller.text = data.address;
        address = data.address;
        if (address!.contains(data.state)) {
          address = address!.replaceAll(data.state, '');
        } else {
          address = address;
        }
        if (address!.contains(',')) {
          address = address!.replaceAll(',', '');
        } else {
          address = address;
        }
        if (address!.contains(data.country)) {
          address = address!.replaceAll(data.country, '');
        } else {
          address = address;
        }
        if (address!.contains(data.city)) {
          address = address!.replaceAll(data.city, '');
        } else {
          address = address;
        }
        if (address!.contains(data.countryCode)) {
          address = address!.replaceAll(data.countryCode, '');
        } else {
          address = address;
        }
        if (address!.contains(data.postalCode)) {
          address = address!.replaceAll(data.postalCode, '');
        } else {
          address = address;
        }
        widget.callback(
          address!,
          destLocation!.longitude,
          destLocation!.latitude,
        );
        // widget.callback;
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getLatLngById() async {
    try {
      final GoogleMapController controller = await _mapController.future;
      GeoData data = await Geocoder2.getDataFromAddress(
        googleMapApiKey: 'AIzaSyBK8UODiBnpgbTS_0AaJIHMuo3gcmXfw-Y',
        address: widget.controller.text,
      );
      widget.callback(
        widget.controller.text,
        data.longitude,
        data.latitude,
      );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(data.latitude, data.longitude),
            zoom: 16,
          ),
        ),
      );
      setState(() {
        destLocation = LatLng(data.latitude, data.longitude);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  getCurrentLocation() async {
    bool servideEnabled;
    PermissionStatus premissionGranted;

    servideEnabled = await location.serviceEnabled();

    if (!servideEnabled) {
      servideEnabled = await location.requestService();
      if (!servideEnabled) {
        return;
      }
    }

    premissionGranted = await location.hasPermission();
    if (premissionGranted == PermissionStatus.denied) {
      premissionGranted = await location.requestPermission();
      if (premissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (premissionGranted == PermissionStatus.granted) {
      location.changeSettings(accuracy: LocationAccuracy.high);

      // controller.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(
      //       target: LatLng(_currentPos!.latitude!, _currentPos!.longitude!),
      //       zoom: 16,
      //     ),
      //   ),
      // );
      // setState(() {
      //   destLocation = LatLng(_currentPos!.latitude!, _currentPos!.longitude!);
      // });
    }

    // _locationController.onLocationChanged.listen(
    //   (LocationData currentLocation) {
    //     if (currentLocation.longitude != null &&
    //         currentLocation.latitude != null) {
    //       setState(() {
    //         _currentP =
    //             LatLng(currentLocation.latitude!, currentLocation.longitude!);
    //       });
    //       if (kDebugMode) {
    //         print(_currentP);
    //       }
    //     }
    //   },
    // );
  }
}
