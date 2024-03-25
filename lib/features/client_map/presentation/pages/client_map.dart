import 'dart:async';
import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/common/constants.dart';
import 'package:goflex/features/maps/data/models/address.dart';
import 'package:goflex/features/maps/data/repositories/map_repo.dart';
import 'package:location/location.dart';

class ClientMapPageDGis extends StatefulWidget {
  const ClientMapPageDGis({
    super.key,
  });

  @override
  State<ClientMapPageDGis> createState() => _ClientMapPageDGisState();
}

class _ClientMapPageDGisState extends State<ClientMapPageDGis> {
  Position? destLocation = const Position(lat: 43.238949, long: 76.889709);
  List<AddressModel> placesPredictions = [];
  Location location = Location();

  String? address;
  late DGisMapController controller;
  final Completer<bool> _isMapReadyCompleter = Completer();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      showModalBottomSheet(
          barrierColor: Colors.transparent,
          isDismissible: false,
          context: context,
          builder: (builder) {
            return Container();
          });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Colors.black12,
          ),
        ),
        centerTitle: true,
        title: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'go',
                style: TextStyle(
                  color: accentColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'flex',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
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
                // widget.controller.text = res['address'];
                // widget.callback(res['address'], position.long, position.lat);
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
      // widget.callback(place, res['long'], res['lat']);
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
      // widget.callback('', 0, 0);
    }
  }

  showBottom() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
