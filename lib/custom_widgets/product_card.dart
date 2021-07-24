import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';

class ProductCard extends StatelessWidget {
  final Map<String, String> product;
  final Function() onTap;

  ProductCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Resources.LIGHT_BLUE_COLOR,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Image.asset(product['image']??''),
          SizedBox(height: 5,),
          Container(
            padding:
            EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(product['name']??'',overflow: TextOverflow.ellipsis,),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                          product['store']??'',
                          style:
                          TextStyle(color: Resources.GREY_TEXT_COLOR),
                          textScaleFactor: .9,
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product['price']??'',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textScaleFactor: 1.2,
                    ),
                    SvgButton(
                        svg: ImageConstant.CART_ITEM_ICON,
                        onTap: onTap),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
