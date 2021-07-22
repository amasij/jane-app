import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
final Map<String, String> store;
StoreCard({required this.store});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 170,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Image.asset(store['image']??''),
          SizedBox(
            height: 20,
          ),
          Text(
            store['name']??'',
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
