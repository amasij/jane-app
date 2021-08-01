import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';

class SelectAddressScreen extends StatefulWidget {
  @override
  _SelectAddressState createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddressScreen> {
  List<bool> activeControls = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
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
            Text('Address'),
            SizedBox.shrink(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.ADD_ADDRESS_SCREEN);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[200]!)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline_outlined,
                          color: Colors.black),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Add New Address',
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return addressCard(index);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: activeControls.length)
            ],
          ),
        ),
      ),
    );
  }

  Stack addressCard(int index) {
    bool isDefault = activeControls[index];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFFEFEFF),
            border: Border.all(
                color: isDefault ? Resources.PRIMARY_COLOR : Colors.grey[200]!),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(
              top: 15, left: 15, right: 15, bottom: isDefault ? 20 : 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.ADDRESS_ICON,
                          width: 35,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'My Home',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDefault
                                  ? Resources.PRIMARY_COLOR
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.edit_outlined,
                    color: Resources.PRIMARY_COLOR,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Raymond D. Obiekwe',
                      style: TextStyle(
                          color: Color(0xFF585858),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '78 Idris Gidado St. Wuye, 900854, FCT Abuja',
                      style: TextStyle(
                        color: Color(0xFF585858),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '+234 816 162 0967',
                      style: TextStyle(
                          color: Color(0xFF585858),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              isDefault
                  ? SizedBox.shrink()
                  : Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: .8,
                            indent: 0,
                            endIndent: 0,
                            height: 0,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                activeControls =
                                    activeControls.map((e) => false).toList();
                                activeControls[index] = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              // color: Colors.redAccent,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Address',
                                      textAlign: TextAlign.center,
                                      textScaleFactor: 1.1,
                                      style: TextStyle(
                                        color: Color(0xFF585858),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
        isDefault
            ? SvgPicture.asset(ImageConstant.ADDRESS_SELECTED_SVG)
            : SizedBox.shrink()
      ],
    );
  }
}
