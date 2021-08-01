
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:jane_app/custom_widgets/forms/shared.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AppPhoneNumberField extends ReactiveFormField<dynamic, dynamic> {
  AppPhoneNumberField({
    Key? key,
    SelectorConfig? selectorConfig,
    ValueChanged<bool>? onInputValidated,
    VoidCallback? onSubmit,
    ValueChanged<String>? onFieldSubmitted,
    String Function(String)? validator,
    Function(String)? onSaved,
    TextEditingController? textFieldController,
    TextInputAction? keyboardAction,
    String? hintText,
    String? errorMessage,
    double? selectorButtonOnErrorPadding,
    int? maxLength,
    bool? isEnabled,
    bool? formatInput,
    bool? autoFocus,
    bool? autoFocusSearch,
    AutovalidateMode? autoValidateMode,
    bool? ignoreBlank,
    bool? countrySelectorScrollControlled,
    String? locale,
    TextStyle? textStyle,
    TextStyle? selectorTextStyle,
    InputBorder? inputBorder,
    InputDecoration? inputDecoration,
    InputDecoration? searchBoxDecoration,
    FocusNode? focusNode,
    List<String>? countries,
    String? formControlName,
    // required FormControl formControl,
    Map<String, String> validationMessages = const {},
    ControlValueAccessor? valueAccessor,
    ShowErrorsFunction? showErrors,
    EdgeInsets labelPadding = const EdgeInsets.only(bottom: 8),
    bool requiredField = false,
    String? label,
  }) : super(
            key: key,
            // formControl: formControl,
            formControlName: formControlName,
            valueAccessor: valueAccessor,
            validationMessages: (e) {
              return {
                'required': 'Phone number is required',
                'maxLength': 'Phone number looks too long',
                'minLength': 'Phone number looks too short',
                'invalidFormat': 'Phone number is not valid',
                ValidationMessage.min: 'Phone number looks too short',
                ValidationMessage.max: 'Phone number looks too long'
              };
            },
            showErrors: showErrors,
            builder: (field) {
              final state = field as _AppReactivePhoneNumberField;
              final effectiveDecoration = (inputDecoration ??
                      const InputDecoration())
                  .applyDefaults(Theme.of(state.context).inputDecorationTheme);
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme:
                      ColorScheme.light(primary: Resources.PRIMARY_COLOR),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 14,
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (e) async {
                          field.didChange(e.phoneNumber);
                        },
                        hintText: hintText,
                        textFieldController: state._textController,
                        focusNode: state._focusController.focusNode,
                        errorMessage: field.errorText,
                        countries: ['NG'],
                        formatInput: true,
                        spaceBetweenSelectorAndTextField: 0,
                        selectorTextStyle: null,
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            setSelectorButtonAsPrefixIcon: true,
                            leadingPadding: 5,
                            showFlags: true),
                        inputDecoration: effectiveDecoration.copyWith(
                            filled: false,
                            fillColor: Colors.white,
                            errorText: state.errorText,
                            isDense: true,
                            hintText: hintText),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          final _contactPicker = await FlutterContactPicker.pickPhoneContact();
                          var contact = _contactPicker.phoneNumber;
                          try {
                            field.didChange(contact!.number);
                            state._textController.text = contact.number!;
                          } catch (ex) {
                            print(ex);
                          }
                        },
                        child: Center(
                          child: Tooltip(
                            message: 'Select from contacts',
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              // decoration: BoxDecoration(
                              //   border: Border(
                              //     right: BorderSide(
                              //       color: Colors.black12,
                              //     ),
                              //   ),
                              // ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.contacts_rounded,
                                    color: Resources.PRIMARY_COLOR,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });

  @override
  ReactiveFormFieldState<dynamic, dynamic> createState() {
    return _AppReactivePhoneNumberField();
  }
}

class _AppReactivePhoneNumberField
    extends ReactiveFormFieldState<AppPhoneNumberField,dynamic> {
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late FocusController _focusController;

  FocusNode get focusNode => _focusNode;

  @override
  void initState() {
    super.initState();
  }


  @override
  void subscribeControl() {
    _registerFocusController(FocusController());
    super.subscribeControl();
  }

  @override
  void unsubscribeControl() {
    _unregisterFocusController();
    super.unsubscribeControl();
  }

  @override
  void onControlValueChanged(dynamic value) {
    var effectiveValue = (value == null) ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  ControlValueAccessor<AppPhoneNumberField, dynamic> selectValueAccessor() {
    return super.selectValueAccessor();
  }

  void _registerFocusController(FocusController focusController) {
    _focusController = focusController;
    this.control.registerFocusController(focusController);
  }

  void _unregisterFocusController() {
    this.control.unregisterFocusController(_focusController);
    _focusController.dispose();
  }
}

class PhoneNumberField extends StatefulWidget {
  final String formControlName;
  // final FormControl formControl;
  final FormGroup form;
  final bool disabled;
  final String hint;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry labelMargin;
  final Map<String, String> validationMessages;

  PhoneNumberField({
    required this.formControlName,
    // required this.formControl,
    required this.hint,
    required this.form,
    this.disabled = false,
    this.validationMessages = const {
      'required': 'Phone number is required',
      'maxLength': 'Phone number looks too long',
      'minLength': 'Phone number looks too short',
      'invalidFormat': 'Phone number is not valid',
      ValidationMessage.min: 'Phone number looks too short',
      ValidationMessage.max: 'Phone number looks too long'
    },
    this.margin = const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
    this.labelMargin = const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
  });

  @override
  _PhoneNumberField createState() => _PhoneNumberField();
}

class _PhoneNumberField extends State<PhoneNumberField> {
  @override
  Widget build(BuildContext context) {
    return AppPhoneNumberField(
      formControlName: widget.formControlName,
      hintText: widget.hint,
      // initialValue: PhoneNumber(phoneNumber: widget.form.controls[widget.formControlName].value,isoCode: 'NG'),
      validationMessages: widget.validationMessages,
      inputDecoration: inputDecoration.copyWith(
        errorStyle: TextStyle(fontSize: 10, height: .7),
        prefixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 45),
        isDense: true,
      ),
      // formControl: widget.formControl,
    );
  }
}
