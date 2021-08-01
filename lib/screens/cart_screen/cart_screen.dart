import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/adder.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/utils/utils.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  StreamController<List<Map<String, dynamic>>> _cartItemStream =
      StreamController();

  List<Map<String, dynamic>> items = [
    {
      'code': '00001',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00002',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00003',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00004',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00005',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00006',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00007',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00008',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00009',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00012',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00022',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00032',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00042',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00052',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00062',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00072',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00082',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
    {
      'code': '00092',
      'name': 'Steakhouse Tabasco Corn Sauce',
      'price': 'N20,000.00'
    },
  ];

  @override
  void dispose() {
    _cartItemStream.close();
    super.dispose();
  }

  @override
  void initState() {
    _cartItemStream.add(items);
    super.initState();
  }

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
      body: Padding(
        padding: Resources.CONTENT_PADDING,
        child: Container(
          height: Utils.getScreen(context).height,
          child: Column(
            children: [
              Expanded(
                flex:7,
                child: Container(
                  child: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: _cartItemStream.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.length > 0) {
                          return ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 15,
                              );
                            },
                            itemBuilder: (context, index) {
                              return _item(index);
                            },
                            itemCount: snapshot.data!.length,
                          );
                        }
                        return _noItem();
                      }),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.CHECKOUT_SCREEN);
                          },
                          useWidget: true,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Checkout',
                                  textScaleFactor: 1.1,
                                ),
                                Text(
                                  'N20,000.00',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textScaleFactor: 1.2,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _noItem() {
    return Column(
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
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Expanded(
              child: AppButton(
                onTap: () {},
                label: 'Start Shopping',
              ),
            )
          ],
        ),
      ],
    );
  }

  Dismissible _item(int index) {
    Map<String, dynamic> item = items[index];
    return Dismissible(
      background: deleteIcon(),
      key: Key(item['code']),
      onDismissed: (direction) {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              // height: 100,
              child: Image.asset('assets/sample/item-small.png'),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(
                    0xffE2F2FF,
                  ),
                  width: 2,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Container(
                // height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textScaleFactor: 1.2,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Jumia official store',
                      style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item['price'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Adder(
                          isLarge: false,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget deleteIcon() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: 20,),
          Container(
            padding: EdgeInsets.only(left: 40),
            child: SvgPicture.asset(ImageConstant.TRASH_SVG),
          ),
          Container(
            padding: EdgeInsets.only(right: 40),
            child: SvgPicture.asset(ImageConstant.TRASH_SVG),
          ),
          // SizedBox(width: 20,),
        ],
      ),
      decoration: BoxDecoration(
        color: Resources.PRIMARY_COLOR,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
