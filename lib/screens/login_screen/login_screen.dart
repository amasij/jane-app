import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormGroup _form = FormGroup({
    'email': FormControl(
        value: '', validators: [Validators.required, Validators.email]),
    'password': FormControl(value: '', validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.LOGIN_BACKGROUND_IMAGE),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: ReactiveForm(
              formGroup: _form,
              child: Column(
                children: [
                  SizedBox(
                    height: Utils.getScreen(context).height * .1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LogoText(),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Hey,',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, letterSpacing: -1),
                        textScaleFactor: 2.1,
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Let\'s sign in',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, letterSpacing: -1),
                          textScaleFactor: 2.1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          'If you are new /',
                          style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                          textScaleFactor: 1.2,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          child: Text(
                            'Create New',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  AppTextField(
                    formControlName: 'email',
                    hintText: 'Email',
                    validationMessages: {
                      ValidationMessage.required: 'Your email is required',
                      ValidationMessage.email: 'This is not a valid email'
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    formControlName: 'password',
                    hintText: 'Password',
                    validationMessages: {
                      ValidationMessage.required: 'Your password is required'
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Forgot password? /',
                          style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                          textScaleFactor: 1.2,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          child: Text(
                            'Reset',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            _form.markAllAsTouched();
                          },
                          label: 'Login',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
