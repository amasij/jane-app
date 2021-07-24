import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field_secondary.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  FormGroup _form = FormGroup({'search': FormControl(value: '')});

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
               shrinkWrap: true,
               scrollDirection: Axis.horizontal,children: [
               getChip(),
               SizedBox(width: 10,),
               getChip(),
               SizedBox(width: 10,),
               getChip(),
             ],),
           )
          ],
        ),
      ),
    );
  }

  Widget getChip(){
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
}
