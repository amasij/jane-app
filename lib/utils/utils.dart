import 'dart:ui';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Utils{
  static String componentToHex(c) {
    var hex = c.toString();
    return hex.length == 1 ? "0" + hex : hex;
  }

  static String rgbToHex(r, g, b) {
    return componentToHex(r) + componentToHex(g) + componentToHex(b);
  }

  static Map<int, Color> getSwatchMap(int r, int g, int b) {
    Map<int, double> data = {
      50: 0.1,
      100: .2,
      200: .3,
      300: .4,
      400: .5,
      500: .6,
      600: .7,
      700: .8,
      800: .9,
      900: 1
    };
    Map<int, Color> color = new Map();
    data.keys.forEach((int x) => color[x] = Color.fromRGBO(r, g, b, data[x] as double));
    return color;
  }

  static MaterialColor generateSwatch(int hex,int r, int g, int b) {
    return MaterialColor(hex, getSwatchMap(r, g, b));
  }

  static Size getScreen(BuildContext context){
    return MediaQuery.of(context).size;
  }

  static bool isNotNull(dynamic obj){
    return obj != null;
  }

  static bool isNull(dynamic obj){
    return !Utils.isNotNull(obj);
  }

  static Dio dio(){
    var options = BaseOptions(
      connectTimeout: 100000,
      receiveTimeout: 30000,
    );
    var dio = Dio();
    dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        )
    );
    return dio;
  }

  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    permission = await Geolocator.requestPermission();

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled.');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied, we cannot request permissions.');
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        print( 'Location permissions are denied (actual value: $permission).');
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}