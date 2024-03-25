import 'dart:async';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/maps/data/models/address.dart';
import 'package:goflex/features/maps/data/repositories/map_repo.dart';
import 'package:location/location.dart';

class MapPageDGis extends StatefulWidget {
  const MapPageDGis({
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
  State<MapPageDGis> createState() => _MapPageDGisState();
}

class _MapPageDGisState extends State<MapPageDGis> {
  Position? destLocation = const Position(lat: 43.238949, long: 76.889709);
  List<AddressModel> placesPredictions = [];
  Location location = Location();

  String? address;
  late DGisMapController controller;
  final Completer<bool> _isMapReadyCompleter = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DGisMap(
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
              if (kDebugMode) {
                print('long: ${position.long}');
                print('lat: ${position.lat}');
              }
              MapRepository repo = MapRepository();
              Map<String, dynamic> res = await repo.getAddressByLatLong(
                  lat: position.lat.toString(), long: position.long.toString());
              if (res['status'] == 200) {
                widget.controller.text = res['address'];
                widget.callback(res['address'], position.long, position.lat);
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
            },
          ),
          SafeArea(
            child: Align(
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
                                    decoration: const InputDecoration(
                                      hintText: 'Введите адрес',
                                      floatingLabelStyle:
                                          TextStyle(color: mainColor),
                                      fillColor: Colors.white,
                                      iconColor: Colors.white,
                                      focusColor: Colors.white,
                                      hoverColor: Colors.white,
                                      hintStyle: TextStyle(
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
                                                      .address_name ??
                                                  '';
                                          setState(() {
                                            getLatLongByAddress(
                                              placesPredictions[index]
                                                      .full_name ??
                                                  '',
                                            );
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 4),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                placesPredictions[index].name ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 2),
                                              Text(
                                                placesPredictions[index]
                                                        .address_name ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
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
          ),
        ],
      ),
    );
  }

  void placesAutocomplete(String place) async {
    MapRepository repo = MapRepository();
    final List<AddressModel>? places = await repo.suggetAddress(place: place);
    setState(() {
      placesPredictions = places ?? [];
    });
  }

  void getLatLongByAddress(String place) async {
    MapRepository repo = MapRepository();
    final Map<String, dynamic> res = await repo.getLatLongByAddress(
      address: place,
    );
    if (res['status'] == 200) {
      widget.callback(place, res['long'], res['lat']);
      controller.moveCamera(
        CameraPosition(
          position: Position(lat: res['lat'], long: res['long']),
          zoom: 17,
        ),
        duration: const Duration(milliseconds: 300),
        animationType: CameraAnimationType.DEFAULT,
      );
      controller.markersController.addMarker(
        Marker(
          position: Position(
            lat: res['lat'],
            long: res['long'],
          ),
          icon: "assets/map_pin.png",
          iconOptions: const MapIconOptions(
            text: '',
            textStyle: MapIconTextStyle(
              fontSize: 13.0,
              color: mainColor,
              strokeColor: mainColor,
              textPlacement: MapIconTextPlacement.TOP_CENTER,
              textOffset: -20.0,
            ),
          ),
        ),
      );
    } else {
      widget.callback('', 0, 0);
    }
  }
}
