import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatelessWidget {
  final String svg;
  final void Function() onTap;

  SvgButton({required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(svg),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 25,
            height: 25,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
