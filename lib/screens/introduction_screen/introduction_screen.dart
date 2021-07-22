import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/utils/utils.dart';

class IntroductionScreens extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoText(),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: IntroductionScreen(
          globalBackgroundColor: Colors.white,
          isTopSafeArea: true,
          isBottomSafeArea: true,
          dotsDecorator: DotsDecorator(
            activeColor: Resources.PRIMARY_TEXT_COLOR,
            activeSize: Size(20,7),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          pages: getPages(),
          showNextButton: true,
          dotsFlex: 1,
          skipFlex: 0,
          nextFlex: 5,
          controlsPadding: EdgeInsets.only(bottom: 40, left: 0, right: 0),
          controlsMargin: EdgeInsets.zero,
          done: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                decoration: BoxDecoration(
                  color: Resources.PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          next: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                decoration: BoxDecoration(
                  color: Resources.PRIMARY_COLOR,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward_sharp,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
          onDone: () {
            Navigator.pushReplacementNamed(context, Routes.HOME_SCREEN);
          },
        ),
      ),
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.zero,
          imageFlex: 2,

        ),
        image: Image.asset(
          ImageConstant.INTRO_WOMAN_IMAGE,
          fit: BoxFit.fill,
        ),
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Discover your',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        height: 1),
                    textScaleFactor: 2.6,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'favorite products',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                    textScaleFactor: 2.6,
                  ),
                ),
              ],
            ),
          ],
        ),
        bodyWidget: Row(
          children: [
            Expanded(
              child: Text(
                'Search, discover, order products',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                textScaleFactor: 1.3,
              ),
            ),
          ],
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          imagePadding: EdgeInsets.zero,
          imageFlex: 2,

        ),
        image: Image.asset(
          ImageConstant.INTRO_MAN_IMAGE,
          fit: BoxFit.fill,
        ),
        titleWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Get them delivered',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        height: 1),
                    textScaleFactor: 2.6,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    ' to you fast',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1,
                    ),
                    textScaleFactor: 2.6,
                  ),
                ),
              ],
            ),
          ],
        ),
        bodyWidget: Row(
          children: [
            Expanded(
              child: Text(
                'Let us handle the delivery and tracking ',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                textScaleFactor: 1.3,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
