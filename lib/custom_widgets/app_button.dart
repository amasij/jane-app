import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';

class AppButton extends StatelessWidget {
  final bool useWidget;
  final String? label;
  final Widget? child;
  final Function() onTap;
  final bool isTransparent;
  final EdgeInsets padding;

  AppButton(
      {this.useWidget = false,
      this.label,
      required this.onTap,
      this.child,
      this.padding = const EdgeInsets.symmetric(vertical: 20),
      this.isTransparent = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(
          padding,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(
            isTransparent ? Resources.PRIMARY_COLOR : Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
            isTransparent ? Color(0xffFFF8F7) : Resources.PRIMARY_COLOR),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Resources.PRIMARY_COLOR),
          ),
        ),
      ),
      onPressed: onTap,
      child: useWidget
          ? child
          : Text(
              label ?? '',
            ),
    );
  }
}
