import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

InputDecoration inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 10, right: 10),
  filled: true,
  fillColor: Resources.PRIMARY_COLOR,
  border: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(5),
  ),
  focusedBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(5),
    borderSide: BorderSide(color: Colors.red, width: 2.0),
  ),
);

final Map<String, String> globValidationMessages = {
  ValidationMessage.required: 'This field is required',
  ValidationMessage.email: 'Invalid email',
  ValidationMessage.minLength: 'Too short',
  ValidationMessage.min: 'Too short',
  ValidationMessage.maxLength: 'Too long',
  ValidationMessage.max: 'Too long',
  'alreadyExists': 'Item already exists.'
};