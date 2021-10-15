import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jane_app/screens/add_address_screen/add_address_screen.dart';
import 'package:jane_app/screens/cart_screen/cart_screen.dart';
import 'package:jane_app/screens/checkout_screen/checkout_screen.dart';
import 'package:jane_app/screens/home_screen/home_screen.dart';
import 'package:jane_app/screens/introduction_screen/introduction_screen.dart';
import 'package:jane_app/screens/login_screen/login_screen.dart';
import 'package:jane_app/screens/map_screen/map_screen.dart';
import 'package:jane_app/screens/map_search_screen/map_search_screen.dart';
import 'package:jane_app/screens/order_confirmation_screen/order_confirmation_screen.dart';
import 'package:jane_app/screens/order_details_screen/order_details_screen.dart';
import 'package:jane_app/screens/order_history_screen/order_history_screen.dart';
import 'package:jane_app/screens/product_details_screen/product_details_screen.dart';
import 'package:jane_app/screens/reset_password_screen/reset_confirmation_screen.dart';
import 'package:jane_app/screens/reset_password_screen/reset_password_screen.dart';
import 'package:jane_app/screens/search_result_screen/search_result_screen.dart';
import 'package:jane_app/screens/search_screen/search_screen.dart';
import 'package:jane_app/screens/select_address_screen/select_address_screen.dart';
import 'package:jane_app/screens/signup_screen/signup_screen.dart';
import 'package:jane_app/screens/splash_screen/splash_screen.dart';
import 'package:jane_app/screens/stores_screen/stores_screen.dart';

class Routes {
  static const String SPLASH_SCREEN = '/splash-screen';
  static const String INTRODUCTION_SCREEN = '/introduction-screen';
  static const String HOME_SCREEN = '/home-screen';
  static const String SEARCH_SCREEN = '/search-screen';
  static const String LOGIN_SCREEN = '/login-screen';
  static const String SIGNUP_SCREEN = '/signup-screen';
  static const String SEARCH_RESULT_SCREEN = '/search-result-screen';
  static const String RESET_PASSWORD_SCREEN = '/reset-password-screen';
  static const String RESET_CONFIRMATION_SCREEN = '/reset-confirmation-screen';
  static const String PRODUCT_DETAILS_SCREEN = '/products-details-screen';
  static const String CART_SCREEN = '/cart-screen';
  static const String STORES_SCREEN = '/stores-screen';
  static const String CHECKOUT_SCREEN = '/checkout-screen';
  static const String SELECT_ADDRESS_SCREEN = '/select-address-screen';
  static const String ORDER_CONFIRMATION_SCREEN = '/order-confirmation-screen';
  static const String ADD_ADDRESS_SCREEN = '/add-address-screen';
  static const String ORDER_HISTORY_SCREEN = '/order-history-screen';
  static const String ORDER_DETAILS_SCREEN = '/order-details-screen';
  static const String MAP_SCREEN = '/map-screen';
  static const String MAP_SEARCH_SCREEN = '/map-search-screen';

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
      case SIGNUP_SCREEN:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RESET_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (_) => ResetPasswordScreen());
      case RESET_CONFIRMATION_SCREEN:
        return MaterialPageRoute(builder: (_) => ResetConfirmationScreen());
      case PRODUCT_DETAILS_SCREEN:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());
      case CART_SCREEN:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case STORES_SCREEN:
        return MaterialPageRoute(builder: (_) => StoresScreen());
      case CHECKOUT_SCREEN:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case SELECT_ADDRESS_SCREEN:
        return MaterialPageRoute(builder: (_) => SelectAddressScreen());
      case ORDER_CONFIRMATION_SCREEN:
        return MaterialPageRoute(builder: (_) => OrderConfirmationScreen());
      case ADD_ADDRESS_SCREEN:
        return MaterialPageRoute(builder: (_) => AddAddressScreen());
      case ORDER_HISTORY_SCREEN:
        return MaterialPageRoute(builder: (_) => OrderHistoryScreen());
      case ORDER_DETAILS_SCREEN:
        return MaterialPageRoute(builder: (_) => OrderDetailsScreen());
      case MAP_SCREEN:
        return MaterialPageRoute(
            builder: (_) => MapScreen(
                  currentPosition: (settings.arguments as LatLng),
                ));
        case MAP_SEARCH_SCREEN:
        return MaterialPageRoute( builder: (_) => MapSearchScreen( ));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
