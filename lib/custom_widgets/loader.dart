import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jane_app/resources/resources.dart';
import 'package:jane_app/utils/utils.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.getScreen(context).width,
      height: Utils.getScreen(context).height,
      color:Color(0xaaFFFFFF),
      child: Center(
        child: CircularProgressIndicator(
          color: Resources.PRIMARY_COLOR,
        ),
      ),
    );
  }
}
