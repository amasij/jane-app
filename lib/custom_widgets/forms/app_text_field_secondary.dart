import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppTextFieldSecondary extends ReactiveTextField {
  AppTextFieldSecondary({
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
        prefixIcon: prefixIcon,
        hintText: hintText, fillColor: Resources.LIGHTEST_BLUE_COLOR),
  );
}
