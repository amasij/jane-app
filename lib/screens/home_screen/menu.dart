import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/utils/utils.dart';

class Menu extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  Menu({required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C3748),
      appBar: AppBar(
        backgroundColor: Color(0xff2C3748),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgButton(
              svg: ImageConstant.DRAWER_ICON_WHITE,
              onTap: () {
                if (zoomDrawerController.isOpen!()) {
                  zoomDrawerController.close!();
                } else {
                  zoomDrawerController.open!();
                }
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Container(
            height: Utils.getScreen(context).height * .85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/sample/avatar.png'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Simon Joseph',
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'View Profile',
                              textScaleFactor: 1.1,
                              style: TextStyle(
                                  color: Color(0xffCBD2DE),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      getDivider(context),
                      SizedBox(
                        height: 30,
                      ),
                      item(Icons.inbox_outlined, 'My Orders', () {
                        Navigator.pushNamed(context, Routes.ORDER_HISTORY_SCREEN);
                      }),
                      SizedBox(
                        height: 40,
                      ),
                      item(
                          Icons.list_alt,
                          'Address Book',
                          () => Navigator.pushNamed(
                              context, Routes.SELECT_ADDRESS_SCREEN)),
                      SizedBox(
                        height: 40,
                      ),
                      item(Icons.settings, 'Settings', () {}),
                      SizedBox(
                        height: 30,
                      ),
                      getDivider(context),
                      SizedBox(
                        height: 30,
                      ),
                      item(
                          Icons.logout_outlined,
                          'Sign out',
                          () => Navigator.pushNamedAndRemoveUntil(
                              context, Routes.LOGIN_SCREEN, (route) => false),
                          isSignOut: true),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'V 1.0',
                          textScaleFactor: 1.1,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget item(IconData icon, String text, void Function() onTap,
      {bool isSignOut = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: isSignOut ? Resources.PRIMARY_COLOR : Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            textScaleFactor: 1.3,
            style: TextStyle(
                color: isSignOut ? Resources.PRIMARY_COLOR : Colors.white),
          )
        ],
      ),
    );
  }

  Widget getDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Utils.getScreen(context).width * 0.25),
      child: Divider(
        color: Colors.grey[100],
      ),
    );
  }
}
