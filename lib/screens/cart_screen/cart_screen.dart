import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            Text('My Cart'),
            SizedBox.shrink(),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: Resources.CONTENT_PADDING,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Utils.getScreen(context).height * .05,
            ),
            Image.asset(ImageConstant.NO_CART_IMAGE),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Your Cart is Empty',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xaa06102B),
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1),
                    textScaleFactor: 1.7,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Looks like you haven’t added anything to your cart yet',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Resources.GREY_TEXT_COLOR,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -1),
                      textScaleFactor: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(children: [
              Expanded(child: AppButton(onTap: (){},label: 'Start Shopping',))
            ],)
          ],
        ),
      )),
    );
  }
}
