import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:phone_number/phone_number.dart' as phone;

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


Future<Map<String, dynamic>> Function(AbstractControl) validatePhoneFormat =
    (e) async {
  if (e.invalid) {
    e.markAsTouched();
    return e.errors;
  }
  e.markAsUntouched();
  if (e.value == null) return Future.value(null);
  if (e.value.length < 14) {
    e.markAsTouched();
    return <String, dynamic>{ValidationMessage.minLength: true};
  }
  if (e.value.length > 14) {
    e.markAsTouched();
    return <String, dynamic>{'maxLength': true};
  }
  try {
    var phoneNumber =
    await phone.PhoneNumberUtil().parse(e.value, regionCode: 'NG');
    return Future.value(null);
  } catch (ex) {
    print(ex);
    e.markAsTouched();
    return <String, dynamic>{'invalidFormat': true};
  }
};