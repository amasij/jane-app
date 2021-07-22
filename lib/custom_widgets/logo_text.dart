import 'dart:ui';

import 'package:flutter/cupertino.dart';

class LogoText extends StatelessWidget {
  final double fontSize;
  final double textScaleFactor;
  final FontWeight fontWeight;
  final Color color;

  LogoText({
    this.fontSize = 20,
    this.textScaleFactor = 1.5,
    this.fontWeight = FontWeight.normal,
    this.color = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'JANE',
      textScaleFactor: textScaleFactor,
      style: TextStyle(
          fontFamily: 'Shrikhand', fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
