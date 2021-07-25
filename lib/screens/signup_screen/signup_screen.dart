import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/app_button.dart';
import 'package:jane_app/custom_widgets/forms/app_text_field.dart';
import 'package:jane_app/custom_widgets/logo_text.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/routes/routes.dart';
import 'package:jane_app/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool showPassword = true;
  FormGroup _form = FormGroup({
    'email': FormControl(
        value: '', validators: [Validators.required, Validators.email]),
    'firstName': FormControl(value: '', validators: [
      Validators.required,
    ]),
    'lastName': FormControl(value: '', validators: [
      Validators.required,
    ]),
    'password': FormControl(value: '', validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.SIGNUP_BACKGROUND_IMAGE),
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
                        'Create a',
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
                          'New Account',
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
                        flex: 4,
                        child: Text(
                          'Already have an account? /',
                          style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                          textScaleFactor: 1.2,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.LOGIN_SCREEN),
                          child: Text(
                            'Sign in',
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
                  AppTextField(
                    formControlName: 'lastName',
                    hintText: 'Surname',
                    validationMessages: {
                      ValidationMessage.required: 'Your surname is required'
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    formControlName: 'firstName',
                    hintText: 'First Name',
                    validationMessages: {
                      ValidationMessage.required: 'Your first name is required'
                    },
                  ),
                  SizedBox(
                    height: 20,
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
                    obscureText: showPassword,
                    hintText: 'Password',
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                        !showPassword ? Icons.visibility : Icons.visibility_off,
                        color: Resources.PRIMARY_COLOR,
                      ),
                    ),
                    validationMessages: {
                      ValidationMessage.required: 'Your password is required',
                      ValidationMessage.minLength:'Minimum of 6 characters required'
                    },
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
                          label: 'Sign up',
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
