import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/screens/home_screen/home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ZoomDrawerController _controller = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _controller,
      style: DrawerStyle.DefaultStyle,
      menuScreen: Container(
        color: Colors.red,
      ),
      mainScreen: Home(zoomDrawerController: _controller,),
      borderRadius: 24.0,
      showShadow: false,
      angle: 0.0,
    );
  }
}
