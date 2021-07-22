import 'dart:ui';

import 'package:flutter/material.dart';

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
}