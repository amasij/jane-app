import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';

class Adder extends StatefulWidget {
  final bool isLarge;
  Adder({this.isLarge = true});
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
              size: widget.isLarge ? 35:15,
              color:Resources.PRIMARY_COLOR,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '$quantity',
            style: TextStyle(fontWeight: FontWeight.bold),
            textScaleFactor: widget.isLarge ? 1.5:1,
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
              size: widget.isLarge ? 35:15,
              color: Resources.PRIMARY_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
