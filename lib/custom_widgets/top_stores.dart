import 'package:flutter/cupertino.dart';
import 'package:jane_app/custom_widgets/store_card.dart';

class TopStores extends StatefulWidget {

  @override
  _TopStoresState createState() => _TopStoresState();
}

class _TopStoresState extends State<TopStores> {

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
    return  Container(
      height: 170,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return StoreCard(
              store: stores[index],
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20,
            );
          },
          itemCount: stores.length),
    );
  }
}
