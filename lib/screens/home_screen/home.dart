import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/custom_widgets/previous_purchases.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/custom_widgets/top_stores.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';

class Home extends StatefulWidget {
  final ZoomDrawerController zoomDrawerController;

  Home({required this.zoomDrawerController});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgButton(
              svg: ImageConstant.DRAWER_ICON,
              onTap: () {
                if (widget.zoomDrawerController.isOpen!()) {
                  widget.zoomDrawerController.close!();
                } else {
                  widget.zoomDrawerController.open!();
                }
              },
            ),
            LogoText(
              textScaleFactor: 1.3,
            ),
            SvgButton(
              svg: ImageConstant.CART_ICON,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: Row(
                children: [
                  Text(
                    'Hey Jason,',
                    textScaleFactor: 1.4,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: Row(
                children: [
                  Text(
                    'Discover your favorite products?',
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.SEARCH_SCREEN),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Resources.LIGHTER_BLUE_COLOR,
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
                        'Search your product',
                        style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                        textScaleFactor: 1.1,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      'Top Stores',
                      textScaleFactor: 1.45,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'See all',
                      textAlign: TextAlign.right,
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Resources.PRIMARY_COLOR),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TopStores(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Recent Purchases',
                      textScaleFactor: 1.45,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'See all',
                      textAlign: TextAlign.right,
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Resources.PRIMARY_COLOR),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PreviousPurchases(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
