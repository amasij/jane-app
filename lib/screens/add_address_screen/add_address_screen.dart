import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/app_toast.dart';
import 'package:jane_app/custom_widgets/forms/app_checkbox_field.dart';
import 'package:jane_app/custom_widgets/forms/app_dropdown_field.dart';
import 'package:jane_app/custom_widgets/forms/app_phone_number_field.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field_secondary.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  FormGroup _form = FormGroup({
    'title': FormControl<String>(value: '', validators: [
      Validators.required,
    ]),
    'deliverTo': FormControl<String>(value: '', validators: [
      Validators.required,
    ]),
    'state': FormControl<String>(value: '', validators: [
      Validators.required,
    ]),
    'address': FormControl<String>(value: '', validators: [
      Validators.required,
    ]),
    'isDefault': FormControl<bool>(
      value: false,
    ),
    'phoneNumber': FormControl<String>(
      value: '',
      validators: [Validators.required],
      // asyncValidators: [
      //   validatePhoneFormat,
      // ],
    )
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.RESET_PASSWORD_BACKGROUND_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: Resources.CONTENT_PADDING,
                child: ReactiveForm(
                  formGroup: _form,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgButton(
                            svg: ImageConstant.BACK_ICON,
                            onTap: () => Navigator.pop(context),
                          ),
                          Text('Add New Address'),
                          SizedBox.shrink(),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      getTextField('title', 'Title', 'e.g Home Address'),
                      SizedBox(
                        height: 20,
                      ),
                      getTextField(
                          'deliverTo', 'Deliver To', 'e.g Simon Joseph'),
                      SizedBox(
                        height: 20,
                      ),
                      getTextField(
                          'phoneNumber', 'Phone Number', 'e.g 070 0000 0000'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'State',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      AppDropDownField<String>(
                          isSecondary: true,
                          formControlName: 'state',
                          items: [
                            DropdownMenuItem<String>(
                              child: Text('Abuja'),
                              value: 'ABUJA',
                            ),
                            DropdownMenuItem<String>(
                              child: Text('Lagos'),
                              value: 'LAGOS',
                            ),
                          ],
                          hintText: 'Select State',
                          onChange: (_) {}),
                      SizedBox(
                        height: 20,
                      ),
                      getTextField('address', 'Address',
                          'e.g block 2, flat 9, Area 1, Abuja',
                          maxLines: 4),
                      SizedBox(
                        height: 10,
                      ),
                      AppCheckBoxField(
                        formControlName: 'isDefault',
                        label: 'Set as default address',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: AppButton(
                            onTap: () {
                              AppToast.show('Hello','SUCCESS', context);
                            },
                            label: 'Save Address',
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getTextField(String controlName, String label, String hint,
      {int maxLines = 1}) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          AppTextFieldSecondary(
            formControlName: controlName,
            hintText: hint,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
