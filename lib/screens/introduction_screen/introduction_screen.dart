import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_dots_decorator.dart';
import 'package:jane_app/custom_widgets/app_dots_indicator.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';

class IntroductionScreens extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreens> {
  PageController controller = PageController();
  int currentIndex = 0;
  double _currentPage = 0;

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
      body: Stack(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: _onScroll,
            child: PageView(
              controller: controller,
              onPageChanged: _onPageChanged,
              scrollDirection: Axis.horizontal,
              children: [
                getFirstPage(),
                getSecondPage(),
              ],
              physics: BouncingScrollPhysics(),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                            child: AppDotsIndicator(
                                reversed: false,
                                dotsCount: 2,
                                position: _currentPage,
                                decorator: AppDotsDecorator(
                                  activeColor: Resources.PRIMARY_TEXT_COLOR,
                                  activeSize: Size(20, 7),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onTap: (_) {})),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (currentIndex == 0) {
                                  controller.animateToPage(1,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                } else {
                                  // Navigator.pushReplacementNamed(
                                  //     context, Routes.HOME_SCREEN);
                                  Navigator.pushReplacementNamed(
                                      context, Routes.LOGIN_SCREEN);
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                decoration: BoxDecoration(
                                  color: Resources.PRIMARY_COLOR,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: currentIndex == 0 ?30:0,),
                                    Text(
                                      currentIndex == 0
                                          ? 'Next'
                                          : 'Get Started',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    currentIndex == 0
                                        ? Icon(
                                            Icons.arrow_forward_sharp,
                                            color: Colors.white,
                                            size: 18,
                                          )
                                        : SizedBox.shrink()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getFirstPage() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(ImageConstant.INTRO_SHOP_IMAGE),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: Resources.CONTENT_PADDING,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Discover your',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                height: 1),
                            textScaleFactor: 2.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'favorite products',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                height: 1),
                            textScaleFactor: 2.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Search, discover, order products',
                            style: TextStyle(
                              color: Resources.GREY_TEXT_COLOR,
                            ),
                            textScaleFactor: 1.3,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSecondPage() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(ImageConstant.INTRO_DELIVERY_IMAGE),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: Resources.CONTENT_PADDING,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Get them delivered',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                height: 1),
                            textScaleFactor: 2.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'to you fast',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                height: 1),
                            textScaleFactor: 2.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Let us handle the delivery and tracking ',
                            style: TextStyle(
                              color: Resources.GREY_TEXT_COLOR,
                            ),
                            textScaleFactor: 1.3,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics && metrics.page != null) {
      if (mounted) {
        setState(() => _currentPage = metrics.page!);
      }
    }
    return false;
  }
}
