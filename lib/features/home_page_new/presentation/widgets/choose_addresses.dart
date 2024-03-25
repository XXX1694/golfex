import 'package:dgis_map_kit/dgis_map_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goflex/features/home_page_new/presentation/widgets/select_address.dart';

class ChooseAddresses extends StatefulWidget {
  const ChooseAddresses({
    super.key,
    required this.toController,
    required this.fromController,
    required this.changeMapStatus,
    required this.fromLat,
    required this.fromLong,
    required this.toLat,
    required this.toLong,
    required this.mapController,
  });
  final TextEditingController toController;
  final TextEditingController toLat;
  final TextEditingController toLong;
  final TextEditingController fromController;
  final TextEditingController fromLat;
  final TextEditingController fromLong;
  final Function(bool) changeMapStatus;
  final DGisMapController mapController;

  @override
  State<ChooseAddresses> createState() => _ChooseAddressesState();
}

class _ChooseAddressesState extends State<ChooseAddresses> {
  // final DGisMapController mapController;
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Row(
            children: [
              SvgPicture.asset('assets/icons/from_dot.svg'),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () {
                    widget.changeMapStatus(true);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: Colors.white,
                      constraints: const BoxConstraints(
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return SelectAddress(
                          controller: widget.fromController, callback: refresh,
                          lat: widget.fromLat, long: widget.fromLong,
                          mapController: widget.mapController,
                          // mapController: mapController,
                        );
                      },
                    );
                  },
                  child: Text(
                    widget.fromController.text.isEmpty
                        ? 'Адрес отправки'
                        : widget.fromController.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: widget.fromController.text.isEmpty
                          ? Colors.black54
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 34),
            child: Divider(
              color: Colors.black12,
              height: 1,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset('assets/icons/to_dot.svg'),
              const SizedBox(width: 20),
              Expanded(
                child: InkWell(
                  onTap: () {
                    widget.changeMapStatus(false);
                    showModalBottomSheet(
                      isScrollControlled: true,
                      useSafeArea: true,
                      backgroundColor: Colors.white,
                      constraints: const BoxConstraints(
                        maxHeight: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return SelectAddress(
                          controller: widget.toController, callback: refresh,
                          lat: widget.toLat, long: widget.toLong,
                          mapController: widget.mapController,
                          // mapController: mapController,
                        );
                      },
                    );
                  },
                  child: Text(
                    widget.toController.text.isEmpty
                        ? 'Адрес доставки'
                        : widget.toController.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: widget.toController.text.isEmpty
                          ? Colors.black54
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 34),
            child: Divider(
              color: Colors.black12,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
