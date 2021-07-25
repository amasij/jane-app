import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';

class Adder extends StatefulWidget {
  @override
  _AdderState createState() => _AdderState();
}

class _AdderState extends State<Adder> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 7),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              if(quantity<1)return;
              setState(() {
                quantity-=1;
              });
            },
            child: Icon(
              Icons.remove,
              size: 35,
              color:Resources.PRIMARY_COLOR,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '$quantity',
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: 1.5,
          ),
          SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: (){
              setState(() {
                quantity+=1;
              });
            },
            child: Icon(
              Icons.add,
              size: 35,
              color: Resources.PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
