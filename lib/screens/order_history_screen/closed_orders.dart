import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/order_card.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';

class ClosedOrders extends StatefulWidget {
  @override
  _ClosedOrdersState createState() => _ClosedOrdersState();
}

class _ClosedOrdersState extends State<ClosedOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      padding: Resources.CONTENT_PADDING,
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          OrderCard(
            isPending: false,
            mode: 'SUCCESS',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'SUCCESS',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),  OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),  OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),SizedBox(height: 15),



          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),

          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'SUCCESS',
          ),
          SizedBox(height: 15),
          OrderCard(
            isPending: false,
            mode: 'FAILED',
          ),
        ],
      ),
    );
  }
}
