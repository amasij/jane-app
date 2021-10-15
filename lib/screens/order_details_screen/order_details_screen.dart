import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_dots_decorator.dart';
import 'package:jane_app/custom_widgets/app_dots_indicator.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
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
            Text('Order Details'),
            SizedBox.shrink(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Column(
            children: [
              Card(
                elevation: .5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Delivery Status',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      getStatusItem(
                        'Ready for pickup',
                        Color(0xffFFA500),
                      ),
                      getDivider('2/11  8:00 PM'),
                      getStatusItem(
                        'Picked up from store',
                        Color(0xffFD5606),
                      ),
                      getDivider('2/11  8:00 PM'),
                      getStatusItem(
                        'Delivering Order',
                        Color(0xffAEEBD4),
                      ),
                      getDivider('2/11  8:00 PM'),
                      getStatusItem(
                        'Order Completed',
                        Colors.grey[300]!,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: .5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Order Details',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Raymond D. Obiekwe',
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ORDER TIME',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                        '2/11 8:00PM',
                                        style:
                                            TextStyle(color: Colors.grey[500]!),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ORDER TOTAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                        'N 20,000.00',
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ITEMS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                      child: Text('12'),
                                    ),
                                  ],
                                )
                              ],
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
                            child: Text(
                              'DELIVER TO',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            '78 Idris Gidado St. Wuye, 900854, FCT Abuja',
                            style: TextStyle(color: Colors.grey[500]!),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'CONTACT',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                        '+234 7026636639',
                                        style:
                                            TextStyle(color: Colors.grey[500]!),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'STATUS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 15),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text('Delivered'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Card(
                elevation: .5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Order Items',
                              textScaleFactor: 1.2,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          children: ([1, 2, 3, 4, 5].map(
                            (e) => Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        // height: 100,
                                        child: Image.asset(
                                            'assets/sample/item-small.png'),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Color(
                                              0x99E2F2FF,
                                            ),
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Wellingtons Tabasco  Corn Sauce (1)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ),
                            ),
                          )).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getStatusItem(String label, Color color) {
    return Row(
      children: [
        getDot(
          color,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget getDot(Color color) {
    return AppDotsIndicator(
        reversed: false,
        dotsCount: 1,
        position: 0,
        decorator: AppDotsDecorator(
          activeColor: color,
          activeSize: Size(16, 16),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: (_) {});
  }

  Widget getLine() {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 13),
      child: DottedLine(
        direction: Axis.vertical,
        lineLength: double.infinity,
        lineThickness: 1.0,
        dashLength: 4.0,
        dashColor: Colors.grey[500]!,
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }

  Widget getDivider(String date) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getLine(),
        SizedBox(
          width: 20,
        ),
        Text(
          date,
          style: TextStyle(color: Colors.grey[500]!),
          textScaleFactor: .8,
        )
      ],
    );
  }
}
