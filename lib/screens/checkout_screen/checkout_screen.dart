import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field_secondary.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  FormGroup _form = FormGroup({'instruction': FormControl(value: '')});

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
            Text('Checkout'),
            SizedBox.shrink(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Resources.CONTENT_PADDING,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Address Details',
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textScaleFactor: 1.3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFEFEFF),
                        border: Border.all(color: Colors.grey[200]!),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 20),
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
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: ()=>Navigator.pushNamed(context, Routes.SELECT_ADDRESS_SCREEN),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Resources.PRIMARY_COLOR),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 17,
                                  ),
                                ),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Special Instructions',
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textScaleFactor: 1.3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Any instructions or messages you’ll like you add for your delivery',
                            style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReactiveForm(
                      formGroup: _form,
                      child: AppTextFieldSecondary(
                        formControlName: 'instruction',
                        hintText: 'Give instructions...',
                        maxLines: 5,
                        maxLength: 300,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 70,),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Order Info',
                            style: TextStyle(fontWeight: FontWeight.w600),
                            textScaleFactor: 1.3,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _getSummary('Subtotal', 'N20,000.00', 1.3),
                    SizedBox(
                      height: 15,
                    ),
                    _getSummary('Delivery Cost', '+ N2,000.00', 1.3),
                    SizedBox(
                      height: 20,
                    ),
                    _getSummary('Total', 'N22,000.00', 1.6),
                    SizedBox(height: 25,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppButton(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.ORDER_CONFIRMATION_SCREEN);
                            },
                            useWidget: true,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Proceed to Payment',
                                    textScaleFactor: 1.1,
                                  ),
                                  Text(
                                    'N20,000.00',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    textScaleFactor: 1.2,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row _getSummary(String key, String value, double scaleFactor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: TextStyle(color: Resources.GREY_TEXT_COLOR),
          textScaleFactor: 1.3,
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: -1),
          textScaleFactor: scaleFactor,
        )
      ],
    );
  }
}
