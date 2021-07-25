import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

InputDecoration inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
  filled: true,
  fillColor: Resources.PRIMARY_COLOR,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Resources.LIGHT_BLUE_COLOR, width: 2.0),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Resources.PRIMARY_COLOR, width: 2.0),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Resources.PRIMARY_COLOR, width: 2.0),
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