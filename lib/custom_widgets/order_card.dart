import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/routes/routes.dart';

import 'app_dots_decorator.dart';
import 'app_dots_indicator.dart';

class OrderCard extends StatefulWidget {
  final bool isPending;
  final String mode;

  OrderCard({required this.isPending, required this.mode});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pushNamed(context, Routes.ORDER_DETAILS_SCREEN),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[200]!)),
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 11),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  getIcon(widget.mode),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'My Home',
                  textScaleFactor: 1.1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                AppDotsIndicator(
                    reversed: false,
                    dotsCount: 1,
                    position: 0,
                    decorator: AppDotsDecorator(
                      activeColor: Colors.black,
                      activeSize: Size(4, 4),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: (_) {}),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'fsefgsefgwergwergwhdhghgdhgdhhdhefvwegerg',
                    style: TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1.1,
                  ),
                ),
                widget.isPending
                    ? SizedBox(
                        width: 10,
                      )
                    : SizedBox.shrink(),
                widget.isPending
                    ? SvgPicture.asset(ImageConstant.ORDER_WAITING_SVG)
                    : SizedBox.shrink(),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '12 Items Order',
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 1.15,
                    style: TextStyle(
                      color: Color(0xff9898A8),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                AppDotsIndicator(
                    reversed: false,
                    dotsCount: 1,
                    position: 0,
                    decorator: AppDotsDecorator(
                      activeColor: Color(0xff9898A8),
                      activeSize: Size(8, 8),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: (_) {}),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '2/11  8:00 PM',
                  textScaleFactor: 1.15,
                  style: TextStyle(
                    color: Color(0xff9898A8),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Text(
                      'N2000.00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xffFF7360), fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  String getIcon(String mode) {
    if (mode == 'PENDING') {
      return ImageConstant.ORDER_PENDING_SVG;
    }
    if (mode == 'SUCCESS') {
      return ImageConstant.ORDER_SUCCESS_SVG;
    }
    if (mode == 'FAILED') {
      return ImageConstant.ORDER_FAILED_SVG;
    }
    return '';
  }
}
