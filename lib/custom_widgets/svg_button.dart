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
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 30,
            height: 30,
            color: Colors.transparent,
            child: Center(child: SvgPicture.asset(svg),),
          ),
        ),
      ],
    );
  }
}
