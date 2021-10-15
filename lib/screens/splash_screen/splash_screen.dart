import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, Routes.INTRODUCTION_SCREEN);
      // Navigator.pushReplacementNamed(context, Routes.ADD_ADDRESS_SCREEN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        ImageConstant.SPLASH_SCREEN_IMAGE,
        fit: BoxFit.cover,
      ),
    );
  }
}
