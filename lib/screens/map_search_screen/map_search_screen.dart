import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/loader.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/models/google_place_item.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/services/map_service.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MapSearchScreen extends StatefulWidget {
  const MapSearchScreen({Key? key}) : super(key: key);

  @override
  _MapSearchScreenState createState() => _MapSearchScreenState();
}

class _MapSearchScreenState extends State<MapSearchScreen> {
  final FormGroup _form = FormGroup({'search': FormControl(value: '')});
  List<String> results = [];
  StreamController<List<Widget>> searchController = StreamController();
  List<Widget> searchResults = [];
  List<GooglePlaceItem> placeItems = [];
  String previousSearchValue = '';
  Timer? previousTimeout;
  late MapService mapService;
  final String apiKey = 'AIzaSyAHrLlwtvdbFE7Jn2F3zWzKxHXfYf9hz7s';
  StreamController<bool> loaderStream = StreamController<bool>();

  @override
  void dispose() {
    searchController.close();
    loaderStream.close();
    super.dispose();
  }

  @override
  void initState() {
    mapService = Provider.of(context, listen: false);
    _form.controls['search']!.valueChanges.listen((event) {
      if ((event as String).isNotEmpty && event.trim() != previousSearchValue) {
        previousSearchValue = event;
        cancelActiveTimeout();
        previousTimeout = Timer(Duration(seconds: 1), () => _search(event));
      } else {
       cancelActiveTimeout();
        placeItems = [];
        _setSearchResults([]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgButton(
              svg: ImageConstant.BACK_ICON,
              onTap: () => Navigator.pop(context),
            ),
            Text('Search your location'),
            Container()
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: ReactiveForm(
              formGroup: _form,
              child: Column(
                children: [
                  ReactiveTextField(
                    autofocus: true,
                    formControlName: 'search',
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      filled: true,
                      fillColor: Color(0x34E2F2FF),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide:
                              BorderSide(color: Resources.LIGHT_BLUE_COLOR)),
                      focusedBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
                      ),
                    ),
                  ),
                  StreamBuilder<List<Widget>>(
                      stream: searchController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Container(
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => getCoordinates(placeItems[index]),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: searchResults[index],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: searchResults.length,
                            ),
                          );
                        }
                        return SizedBox.shrink();
                      })
                ],
              ),
            ),
          ),
          StreamBuilder<bool>(
            stream: loaderStream.stream,
              builder: (_,snapshot){
            if(snapshot.hasData){
              return snapshot.data??false ? Loader():SizedBox.shrink();
            }
            return SizedBox.shrink();
          })
        ],
      ),
    );
  }

  getCoordinates(GooglePlaceItem item) async {
    loaderStream.add(true);
    var res = await Utils.dio().get(
        'https://maps.googleapis.com/maps/api/geocode/json?place_id=${item.placeId}&key=$apiKey');
    var data = Map.from(res.data);
    List<GooglePlaceItem> places = (data['results'] as List<dynamic>)
        .map((e) {
          var location = e!['geometry']!['location'];
          var place = GooglePlaceItem();
          if (Utils.isNull(location)) {
            place.hasData = false;
            return place;
          }
          place.name = e['formatted_address'];
          place.coordinate = LatLng(location['lat'], location['lng']);
          place.hasData = true;
          place.placeId = e['place_id'];
          return place;
        })
        .where((element) => element.hasData)
        .toList();
    if (places.isNotEmpty) {
      Navigator.pop(context, places.first);
    } else {
      Navigator.pop(context);
    }
  }

  cancelActiveTimeout(){
    if (Utils.isNotNull(previousTimeout) && previousTimeout!.isActive) {
      previousTimeout!.cancel();
    }
  }

  _search(String search) async {
    _setSearchResults([]);

    var res = await Utils.dio().get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$apiKey');

    var data = Map.from(res.data);
    placeItems = (data['predictions'] as List<dynamic>).map((e) {
      var place = GooglePlaceItem();
      place.name = e['description'];
      place.placeId = e['place_id'];
      return place;
    }).toList();
    var formatted =  placeItems.map((e) => _formatResult(e.name, search.trim())).toList();
    _setSearchResults(formatted);
  }

  Widget _formatResult(String result, String search) {
    List<String> data = result.toLowerCase().split(search.toLowerCase());
    if (data.length == 1) {
      return RichText(
        text: TextSpan(
          text: data[0],
          style: TextStyle(color: Colors.black),
          children: [
            data[0].contains(search)
                ? TextSpan(
                    text: search,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                : TextSpan(text: ''),
          ],
        ),
      );
    }
    List<TextSpan> spans = [];
    for (var i = 0; i < data.length; i++) {
      spans.add(TextSpan(text: data[i]));
      if (i < (data.length - 1)) {
        spans.add(TextSpan(
            text: search, style: TextStyle(fontWeight: FontWeight.bold)));
      }
    }
    return RichText(
      text: TextSpan(children: spans, style: TextStyle(color: Colors.black)),
    );
  }

  _setSearchResults(List<Widget> results) {
    searchResults = results;
    searchController.add(searchResults);
  }
}
