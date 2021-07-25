import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';

class ResetConfirmationScreen extends StatefulWidget {
  @override
  _ResetConfirmationScreenState createState() =>
      _ResetConfirmationScreenState();
}

class _ResetConfirmationScreenState extends State<ResetConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Help',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(ImageConstant.RESET_PASSWORD_BACKGROUND_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: Utils.getScreen(context).height * .1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoText(),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Reset',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, letterSpacing: -1),
                      textScaleFactor: 2.1,
                    ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Password',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, letterSpacing: -1),
                        textScaleFactor: 2.1,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.04),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1, 1), // changes position of shadow
                        ),
                      ],
                      // borderRadius: BorderRadius.circular(55),
                    ),
                    child: SvgPicture.asset(ImageConstant.RESET_PASSWORD_SVG)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Check your email for instructions to reset your password',
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.4,
                      style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                    ))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_rounded,
                              color: Resources.PRIMARY_COLOR,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Go back to Login',textScaleFactor: 1.2,
                              style:
                              TextStyle(color: Resources.PRIMARY_COLOR),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
