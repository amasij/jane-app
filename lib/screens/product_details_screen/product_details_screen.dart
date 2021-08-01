import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/adder.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/app_dots_decorator.dart';
import 'package:jane_app/custom_widgets/app_dots_indicator.dart';
import 'package:jane_app/custom_widgets/cart_buttton.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsScreen> {
  final CarouselController _controller = CarouselController();
  double currentIndex = 0;

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
            CartButton(hasItem: true,),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 250.0,
                    onScrolled: (_) {
                      _onScroll(_!);
                    }),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Image.asset('assets/sample/product.png');
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: 0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Center(
                        child: AppDotsIndicator(
                            reversed: false,
                            dotsCount: 5,
                            position: currentIndex,
                            decorator: AppDotsDecorator(
                              activeColor: Resources.PRIMARY_COLOR,
                              activeSize: Size(20, 7),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onTap: (_) {})),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Wellingtons Steakhouse Sauce',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, letterSpacing: -1),
                      textScaleFactor: 2.1,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: TabBar(
                        indicatorWeight: 5,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 5,
                              color: Resources.PRIMARY_COLOR,
                            ),
                            insets: EdgeInsets.symmetric(horizontal: 30)),
                        tabs: [
                          Tab(
                            child: Text(
                              'Description',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.start,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Commentary',
                              textScaleFactor: 1.2,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .19,
                      child: TabBarView(
                        children: [
                          Container(
                            child: ListView(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Wellington is a steak dish of English origin, made out of fillet steak coated with pâté (often pâté de foie gras) and duxelles, wrapped in puff pastry, then baked. Some recipes include wrapping the coated meat in a crêpe or parma ham to retain the.',
                                            textScaleFactor: 1.3,
                                            style: TextStyle(
                                                color:
                                                    Resources.GREY_TEXT_COLOR,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Text(""),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'N3,000.00',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: -2),
                    textScaleFactor: 2,
                  ),
                  Adder()
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: AppButton(
                    onTap: () {},
                    label: 'Add to Cart',
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll(double amount) {
    setState(() {
      currentIndex = (amount - 10000) % 5;
    });
  }
}
