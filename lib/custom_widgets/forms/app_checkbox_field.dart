import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppCheckBoxField extends ReactiveFormField<bool, bool> {
  AppCheckBoxField({
    Key? key,
    String? formControlName,
    String? label,
    FormControl? formControl,
    bool tristate = false,
    Map<String, String> validationMessages = const {},
    Color checkColor = Colors.white,
    EdgeInsets padding = const EdgeInsets.all(0),
    Color? hoverColor,
    MaterialTapTargetSize? materialTapTargetSize,
    VisualDensity? visualDensity,
    bool autofocus = false,
  }) : super(
          key: key,
          formControlName: formControlName,
          validationMessages: (e) {
            return {}
              ..addAll(globValidationMessages)
              ..addAll(validationMessages);
          },
          builder: (ReactiveFormFieldState<bool, bool> field) {
            return InputDecorator(
              decoration: inputDecoration.copyWith(
                  errorText: field.errorText,
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Colors.transparent,
                  enabledBorder: InputBorder.none),
              child: Container(
                padding: padding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      value: field.value ?? false,
                      onChanged: field.control.enabled ? field.didChange : null,
                      tristate: tristate,
                      activeColor: Resources.PRIMARY_COLOR,
                      checkColor: checkColor,
                      focusColor: Resources.PRIMARY_COLOR,
                      hoverColor: hoverColor,
                      materialTapTargetSize: materialTapTargetSize,
                      visualDensity: visualDensity,
                      autofocus: autofocus,
                    ),
                    Expanded(
                      child: Text(
                        label!,
                        style: TextStyle(color: Color(0xaa06102B)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );

  @override
  ReactiveFormFieldState<bool, bool> createState() =>
      ReactiveFormFieldState<bool, bool>();
}
