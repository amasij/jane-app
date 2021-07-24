import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/screens/home_screen/home_screen.dart';
import 'package:jane_app/screens/introduction_screen/introduction_screen.dart';
import 'package:jane_app/screens/login_screen/login_screen.dart';
import 'package:jane_app/screens/search_result_screen/search_result_screen.dart';
import 'package:jane_app/screens/search_screen/search_screen.dart';
import 'package:jane_app/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String SPLASH_SCREEN = '/splash-screen';
  static const String INTRODUCTION_SCREEN = '/introduction-screen';
  static const String HOME_SCREEN = '/home-screen';
  static const String SEARCH_SCREEN = '/search-screen';
  static const String LOGIN_SCREEN = '/login-screen';
  static const String SIGNUP_SCREEN = '/signup-screen';
  static const String SEARCH_RESULT_SCREEN = '/search-result-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case INTRODUCTION_SCREEN:
        return MaterialPageRoute(builder: (_) => IntroductionScreens());
      case HOME_SCREEN:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case SEARCH_SCREEN:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case SEARCH_RESULT_SCREEN:
        return MaterialPageRoute(builder: (_) => SearchResultScreen());
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
