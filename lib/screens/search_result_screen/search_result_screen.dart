import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field_secondary.dart';
import 'package:jane_app/custom_widgets/product_card.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  FormGroup _form = FormGroup({'search': FormControl(value: '')});
  ScrollController _scrollController = ScrollController();
  List<Map<String, String>> products = [
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
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => _scrollController.jumpTo(100));
  }

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
            Text('Search products'),
            SvgButton(
              svg: ImageConstant.CART_ACTIVE_ICON,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Resources.CONTENT_PADDING,
              child: Row(
                children: [
                  ReactiveForm(
                    formGroup: _form,
                    child: Expanded(
                      flex: 6,
                      child: AppTextFieldSecondary(
                        hintText: 'Search product',
                        formControlName: 'search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      flex: 1,
                      child: AppButton(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        onTap: () {},
                        useWidget: true,
                        child: SvgPicture.asset(ImageConstant.FILTER_ICON),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  getChip(),
                  SizedBox(
                    width: 15,
                  ),
                  getChip(),
                  SizedBox(
                    width: 15,
                  ),
                  getChip(),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: Resources.CONTENT_PADDING,
                    child: false ? hasProducts() : noProduct(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getChip() {
    return FilterChip(
      showCheckmark: true,
      selected: true,
      label: Text(
        'Lowest price',
        style: TextStyle(color: Resources.PRIMARY_COLOR),
      ),
      onSelected: (_) {},
      pressElevation: 0,
      elevation: 0,
      checkmarkColor: Resources.PRIMARY_COLOR,
      side: BorderSide(color: Resources.PRIMARY_COLOR),
      selectedColor: Color(0x19FF7360),
      backgroundColor: Color(0x19FF7360),
    );
  }

  Widget noProduct() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
        ),
        SvgPicture.asset(ImageConstant.NO_PRODUCT_SVG),
        SizedBox(height: 50,),
        Row(
          children: [
            Expanded(
              child: Text(
                'No Products Found',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xaa06102B),
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1),
                textScaleFactor: 1.7,
              ),
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: Text(
                'Try updating the filter or searching for a different product.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Resources.GREY_TEXT_COLOR,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -1),
                textScaleFactor: 1.2,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget hasProducts() {
    return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        itemCount: products.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Found',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, letterSpacing: -1),
                            textScaleFactor: 2.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '23 Products',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700, letterSpacing: -1),
                            textScaleFactor: 2.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return ProductCard(
            product: products[index - 1],
            onTap: () {},
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(1, index == 0 ? .5 : 1.25);
        });
  }
}
