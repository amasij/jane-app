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
              hintText: hintText, fillColor: Resources.LIGHTER_BLUE_COLOR),
        );
}
