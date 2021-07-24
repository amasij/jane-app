import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppTextField extends ReactiveTextField {
  AppTextField({
    required String formControlName,
    String hintText = '',
    int maxLines = 1,
    int? maxLength,
    Widget? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    Map<String, String> validationMessages = const {},
    bool obscureText = false,
  }) : super(
          style: TextStyle(color: Colors.black),
          formControlName: formControlName,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          cursorColor: Resources.PRIMARY_COLOR,
          validationMessages: (e) {
            return {}
              ..addAll(globValidationMessages)
              ..addAll(validationMessages);
          },
          decoration: inputDecoration.copyWith(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[200]!, width: 2.0),
            ),
            fillColor:Color(0xffF4f4f4),
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            prefixIcon: prefixIcon,
              hintText: hintText,),
        );
}
