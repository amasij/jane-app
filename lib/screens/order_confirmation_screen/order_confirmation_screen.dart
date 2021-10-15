import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';

class OrderConfirmationScreen extends StatefulWidget {
  @override
  _OrderConfirmationScreenState createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'THANK YOU FOR',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.9,
                      style: TextStyle(
                          letterSpacing: -2,
                          fontFamily: 'Roboto Condensed',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'YOUR ORDER!',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.9,
                      style: TextStyle(
                          letterSpacing: -2,
                          fontFamily: 'Roboto Condensed',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: SvgPicture.asset(ImageConstant.RESET_PASSWORD_SVG),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Estimated delivery',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '12 Minutes',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.3,
                      style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'We’ve emailed you a confirmation and we’ll notify you when your order has shipped.',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.1,
                      // style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: 'Track order status',
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.ORDER_DETAILS_SCREEN);
                      },
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      isTransparent: true,
                      label: 'Back to home',
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                          context, Routes.HOME_SCREEN, (_) => false),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
