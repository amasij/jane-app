import 'package:flutter/cupertino.dart';
import 'package:jane_app/custom_widgets/product_card.dart';

class PreviousPurchases extends StatefulWidget {

  @override
  _PreviousPurchasesState createState() => _PreviousPurchasesState();
}

class _PreviousPurchasesState extends State<PreviousPurchases> {
  List<Map<String,String>> products = [
    {
      'image': 'assets/sample/item1.png',
      'name': 'Ketchup',
      'price': 'N 2,000.00',
      'store': 'Shoprite'
    },
    {
      'image': 'assets/sample/item1.png',
      'name': 'Grand loaf',
      'price': 'N 9000.00',
      'store': 'Grand Square'
    },
    {
      'image': 'assets/sample/item1.png',
      'name': 'Methylated Spirit',
      'price': 'N 1,000.00',
      'store': 'H-Medix'
    },
    {
      'image': 'assets/sample/item1.png',
      'name': 'Dove Roll-on',
      'price': 'N 550.00',
      'store': 'H-Medix'
    },
    {
      'image': 'assets/sample/item1.png',
      'name': 'Ketchup hghuhgugy',
      'price': 'N 2,000.00',
      'store': 'Shoprite'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 260,
      child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
           return  ProductCard(
             product: products[index],
             onTap: () => print('Add to cart'),
           );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 20,
            );
          },
          itemCount: products.length),
    );
  }
}
