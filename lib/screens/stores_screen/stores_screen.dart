import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/cart_buttton.dart';
import 'package:jane_app/custom_widgets/store_card.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';

class StoresScreen extends StatefulWidget {
  @override
  _StoresScreenState createState() => _StoresScreenState();
}

class _StoresScreenState extends State<StoresScreen> {
  List<Map<String, String>> stores = [
    {'name': 'Jumia', 'image': 'assets/sample/store1.png'},
    {'name': 'Supermat', 'image': 'assets/sample/store2.png'},
    {'name': 'Shoprite', 'image': 'assets/sample/store3.png'},
    {'name': 'Miniso', 'image': 'assets/sample/store4.png'},
    {'name': 'H-Medix', 'image': 'assets/sample/store5.png'},
    {'name': 'Shoprite', 'image': 'assets/sample/store3.png'},
    {'name': 'Miniso', 'image': 'assets/sample/store4.png'},
    {'name': 'Supermat', 'image': 'assets/sample/store2.png'},
    {'name': 'Jumia', 'image': 'assets/sample/store1.png'},
    {'name': 'Supermat', 'image': 'assets/sample/store2.png'},
    {'name': 'Shoprite', 'image': 'assets/sample/store3.png'},
    {'name': 'Miniso', 'image': 'assets/sample/store4.png'},
  ];

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
            Text('Top stores'),
            CartButton(),
          ],
        ),
      ),
      body: Container(
        padding: Resources.CONTENT_PADDING,
        child: GridView.builder(
          itemCount: stores.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: (1 / 1),
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: StoreCard(store: stores[index]),
            );
          },
        ),
      ),
    );
  }
}
