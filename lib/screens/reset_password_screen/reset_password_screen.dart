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

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  FormGroup _form = FormGroup({
    'email': FormControl(
        value: '', validators: [Validators.required, Validators.email]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Help',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage(ImageConstant.RESET_PASSWORD_BACKGROUND_IMAGE),
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
                        'Reset',
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
                          'Password',
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
                        child: Text(
                          'Enter the email associated with your account and we’ll send an email with instruction to reset your password',
                          style: TextStyle(color: Resources.GREY_TEXT_COLOR),
                          textScaleFactor: 1.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          onTap: () {
                            // _form.markAllAsTouched();
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                Routes.RESET_CONFIRMATION_SCREEN,
                                (_) => _.isFirst);
                          },
                          label: 'Reset Password',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_rounded,
                                color: Resources.PRIMARY_COLOR,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Go back to Login',
                                textScaleFactor: 1.2,
                                style:
                                    TextStyle(color: Resources.PRIMARY_COLOR),
                              )
                            ],
                          ),
                        ),
                      )
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
