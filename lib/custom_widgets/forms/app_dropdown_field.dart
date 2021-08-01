import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppDropDownField<T> extends ReactiveDropdownField<T> {
  AppDropDownField({
    required String formControlName,
    required List<DropdownMenuItem<T>> items,
    bool isSecondary = false,
    required String hintText,
    Map<String, String> validationMessages = const {},
    required void Function(T?) onChange,
  }) : super(
            formControlName: formControlName,
            items: items,
            validationMessages: (e) {
              return {}..addAll(validationMessages);
            },
            onChanged: onChange,
//            style: TextStyle(color: Colors.white),
            decoration: inputDecoration.copyWith(
                hintText: hintText,
                fillColor: isSecondary
                    ? Resources.LIGHTEST_BLUE_COLOR
                    : Colors.white));
}
