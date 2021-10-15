import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/screens/order_history_screen/closed_orders.dart';
import 'package:jane_app/screens/order_history_screen/open_orders.dart';
import 'package:jane_app/utils/utils.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
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
            Text('My Orders'),
            SizedBox.shrink(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                child: TabBar(
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 5,
                      color: Resources.PRIMARY_COLOR,
                    ),
                    // insets: EdgeInsets.symmetric(horizontal: 30),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'Open Orders',
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Closed Orders',
                        textScaleFactor: 1.2,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: Utils.getScreen(context).height*.85,
                child: TabBarView(
                  children: [
                    OpenOrders(),
                    ClosedOrders(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
