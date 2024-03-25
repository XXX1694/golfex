import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/common/colors.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/address_field.dart';
import 'package:goflex/features/maps/data/models/address.dart';
import 'package:goflex/features/maps/data/repositories/map_repo.dart';

class SelectAddress extends StatefulWidget {
  const SelectAddress({
    super.key,
    required this.controller,
    required this.callback,
    required this.lat,
    required this.long,
    required this.mapController,
    // required this.mapController,
  });
  final TextEditingController controller;
  final TextEditingController lat;
  final TextEditingController long;
  final Function callback;
  final DGisMapController mapController;
  // final DGisMapController mapController;

  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> {
  List<AddressModel> suggestions = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
        color: Color(0xFFFAFAFA),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SelectAddressField(
              controller: widget.controller,
              callback: placesAutocomplete,
              refresh: widget.callback,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: suggestions.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: GestureDetector(
                    onTap: () {
                      widget.controller.text =
                          suggestions[index].address_name ?? '';
                      setState(() {
                        getLatLongByAddress(
                          suggestions[index].full_name ?? '',
                        );
                      });
                      widget.callback();
                    },
                    child: SizedBox(
                      height: 52,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/map_icon.svg'),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    suggestions[index].name ?? '',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                      height: suggestions[index].address_name !=
                                              null
                                          ? 2
                                          : 0),
                                  suggestions[index].address_name != null
                                      ? Text(
                                          suggestions[index].address_name ?? '',
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void placesAutocomplete(String place) async {
    MapRepository repo = MapRepository();
    final List<AddressModel>? places = await repo.suggetAddress(place: place);
    setState(() {
      suggestions = places ?? [];
    });
  }

  void getLatLongByAddress(String place) async {
    MapRepository repo = MapRepository();
    final Map<String, dynamic> res = await repo.getLatLongByAddress(
      address: place,
    );
    if (res['status'] == 200) {
      widget.lat.text = res['lat'].toString();
      widget.long.text = res['long'].toString();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      widget.mapController.moveCamera(
        CameraPosition(
          position: Position(lat: res['lat'], long: res['long']),
          zoom: 17,
        ),
        duration: const Duration(milliseconds: 300),
        animationType: CameraAnimationType.DEFAULT,
      );
      widget.mapController.markersController.addMarker(
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
    }
  }
}
