import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/screens/home_screen/home_screen.dart';
import 'package:jane_app/screens/introduction_screen/introduction_screen.dart';
import 'package:jane_app/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String SPLASH_SCREEN = '/splash-screen';
  static const String INTRODUCTION_SCREEN = '/introduction-screen';
  static const String HOME_SCREEN = '/home-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case INTRODUCTION_SCREEN:
        return MaterialPageRoute(builder: (_) => IntroductionScreens());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
