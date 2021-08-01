import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/resources/resources.dart';

class AppToast {
  static void show(String msg, String mode, BuildContext context,
      {int duration = 3000}) {
    dismiss();
    AppToast._createView(
        msg, mode, duration, context);
  }

  static OverlayEntry? _overlayEntry;
  static bool isVisible = false;

  static void _createView(
    String msg,
    String mode,
    int duration,
    BuildContext context,
  ) async {
    var overlayState = Overlay.of(context);

    final themeData = Theme.of(context);
final Map<String, dynamic> modeData = getModeData(mode);
    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => _ToastAnimatedWidget(
        child: Container(
          width: MediaQuery.of(context).size.width ,
          child: Container(
            decoration: BoxDecoration(
              color: modeData['backgroundColor'],
              border: Border.all(color: modeData['borderColor']),
              borderRadius: BorderRadius.circular(40),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  modeData['image'],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  msg,
                  softWrap: true,
                  style: themeData.textTheme.bodyText2!.copyWith(
                    color: Color(0xff6F767E),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    isVisible = true;
    overlayState!.insert(_overlayEntry!);
    Timer(Duration(milliseconds: duration), () {
      dismiss();
    });
  }

static Map<String,dynamic> getModeData(String mode){
    double alpha = 0.5;
  if (mode == 'SUCCESS') {
    return {
      'image':ImageConstant.TOAST_SUCCESS_SVG,
      'borderColor': Color.fromRGBO(62, 190, 97,alpha),
      'backgroundColor': Color(0xffF9FBF9),
    };
  }

  if (mode == 'ERROR') {
    return {
      'image':ImageConstant.TOAST_ERROR_SVG,
      'borderColor': Color.fromRGBO(245, 121, 105,alpha),
      'backgroundColor': Color(0xffFBF4F4),
    };
  }

  if (mode == 'INFO') {
    return {
      'image':ImageConstant.TOAST_INFO_SVG,
      'borderColor': Color.fromRGBO(99, 160, 234, alpha),
      'backgroundColor': Color(0xffEEF3FC),
    };
  }

  if (mode == 'WARNING') {
    return {
      'image':ImageConstant.TOAST_WARNING_SVG,
      'borderColor': Color.fromRGBO(252, 186, 110, alpha),
      'backgroundColor': Color(0xffFDF8F2),
    };
  }
  return {};
}


  static dismiss() async {
    if (!isVisible) {
      return;
    }
    isVisible = false;
    _overlayEntry?.remove();
  }
}

class _ToastAnimatedWidget extends StatefulWidget {
  _ToastAnimatedWidget({
    required this.child,
  });

  final Widget child;

  @override
  _ToastWidgetState createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastAnimatedWidget>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true; //update this value later

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 50,
        child: AnimatedOpacity(
          onEnd: () {
            print('here');
            setState(() {
              _isVisible = false;
            });
          },
          duration: Duration(seconds: 2),
          opacity: _isVisible ? 1.0 : 0.0,
          child: widget.child,
        ));
  }
}
