import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/size_config.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    this.title,
    this.height,
    this.width,
    this.backgroundColor,
    this.onTap,
    super.key,
  });

  String? title;
  double? width, height;
  Color? backgroundColor;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? getProportionateScreenWidth(340),
        height: height ?? getProportionateScreenHeight(45),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppConstants.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            title ?? AppConstants.signUp,
            style: TextStyle(
              fontFamily: AppConstants.fontInterMedium,
              color: AppConstants.clrBackground,
              fontSize: getProportionateScreenWidth(16),
            ),
          ),
        ),
      ),
    );
  }
}
