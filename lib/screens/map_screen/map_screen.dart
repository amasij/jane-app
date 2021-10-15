import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/models/google_place_item.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/services/map_service.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  final LatLng currentPosition;

  MapScreen({required this.currentPosition});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  late LatLng selectedPosition;
  late MapService mapService;
   late GooglePlaceItem autoCompletePlace;

  @override
  void initState() {
    mapService = Provider.of(context, listen: false);
    autoCompletePlace = GooglePlaceItem();
    autoCompletePlace.hasData = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onCameraMove: (position) {
              selectedPosition = position.target;
            },
            initialCameraPosition: CameraPosition(
              target: widget.currentPosition,
              zoom: 14.4746,
            ),
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            top: Utils.getScreen(context).height * .08,
            child: Container(
              width: Utils.getScreen(context).width,
              padding: Resources.CONTENT_PADDING,
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      isTransparent: true,
                      useWidget: true,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.MAP_SEARCH_SCREEN)
                              .then((value) async {
                        if (Utils.isNotNull(value)) {
                          var control = await _controller.future;
                          control.moveCamera(CameraUpdate.newLatLng(
                              (value as GooglePlaceItem).coordinate));
                          autoCompletePlace = value;
                          setState(() {});
                        }
                      }),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Resources.LIGHT_BLUE_COLOR),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Search your location',
                              style:
                                  TextStyle(color: Resources.GREY_TEXT_COLOR),
                              textScaleFactor: 1.1,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: Utils.getScreen(context).height * .5,
            left: Utils.getScreen(context).width * .47,
            child: Image.asset('assets/sample/marker.png'),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: Utils.getScreen(context).width,
              padding: Resources.CONTENT_PADDING,
              child: Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () {
                        if(autoCompletePlace.hasData && autoCompletePlace.coordinate.toString() == selectedPosition.toString()){
                          Navigator.pop(context,{'description':autoCompletePlace.name,'position':autoCompletePlace.coordinate});
                        }else{
                          Navigator.pop(context,{'position':selectedPosition,'description':'Location Selected'});
                        }

                      },
                      label: 'Pick Location',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
