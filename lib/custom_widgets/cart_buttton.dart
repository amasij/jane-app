import 'package:flutter/cupertino.dart';
import 'package:jane_app/constants/image_constant.dart';
import 'package:jane_app/custom_widgets/svg_button.dart';
import 'package:jane_app/routes/routes.dart';

class CartButton extends StatelessWidget {
  final bool hasItem;
CartButton({this.hasItem = false});
  @override
  Widget build(BuildContext context) {
    return SvgButton(
      svg: hasItem ? ImageConstant.CART_ACTIVE_ICON:ImageConstant.CART_ICON,
      onTap: () {
Navigator.pushNamed(context, Routes.CART_SCREEN);
      },
    );
  }
}
