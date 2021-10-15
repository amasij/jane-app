import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jane_app/models/google_place_item.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/utils/utils.dart';

class MapPreview extends StatefulWidget {
  final double? height;
  final LatLng initialPosition;
  final String description;

  MapPreview(
      {required this.initialPosition, this.height, required this.description});

  @override
  _MapPreviewState createState() => _MapPreviewState();
}

class _MapPreviewState extends State<MapPreview> {
  final Completer<GoogleMapController> _controller = Completer();
  late String description;
  late LatLng position;

  @override
  void initState() {
    description = widget.description;
    position = widget.initialPosition;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white),
      height: widget.height ?? Utils.getScreen(context).height * .2,
      child: Stack(
        children: [
          GoogleMap(
            mapToolbarEnabled: false,
            rotateGesturesEnabled: false,
            scrollGesturesEnabled: false,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: position,
              zoom: 14.4746,
            ),
            markers: getMarker(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: Utils.getScreen(context).width * .91,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                  color: Resources.PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      description.isEmpty
                          ? 'Pick your delivery location on the map'
                          : description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pushNamed(context, Routes.MAP_SCREEN,
                          arguments: widget.initialPosition)
                      .then((value) async {
                    var data = (value as Map<String, dynamic>);
                    description = data['description'] ?? '';
                    position = (data['position'] as LatLng);
                    var control = await _controller.future;
                    control.moveCamera(CameraUpdate.newLatLng(position));
                    setState(() {});
                  }),
              child: Container())
        ],
      ),
    );
  }

  Set<Marker> getMarker() {
    return {
      Marker(markerId: MarkerId('00'), position: position),
    };
  }
}
