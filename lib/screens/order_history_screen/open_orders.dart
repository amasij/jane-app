import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/order_card.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';

class OpenOrders extends StatefulWidget {

  @override
  _OpenOrdersState createState() => _OpenOrdersState();
}

class _OpenOrdersState extends State<OpenOrders> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      padding: Resources.CONTENT_PADDING,
      // height: Utils.getScreen(context).height * .6,
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          OrderCard(isPending: true,mode: 'PENDING',)
        ],
      ),
    );
  }
}
