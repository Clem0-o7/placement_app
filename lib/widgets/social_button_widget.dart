import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/size_config.dart';

class SocialButtonWidget extends StatelessWidget {
  SocialButtonWidget({
    this.title,
    this.height,
    this.width,
    this.backgroundColor,
    this.onTap,
    this.icon,
    super.key,
  });

  final String? title;
  final String? icon;
  final double? width, height;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? getProportionateScreenWidth(340),
        height: height ?? getProportionateScreenHeight(50),
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppConstants.mainColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            width: 1,
            color: AppConstants.greyColor1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              SvgPicture.asset(
                icon!,
                width: getProportionateScreenWidth(25),
              ),
            if (title != null && title!.isNotEmpty) ...[
              SizedBox(width: getProportionateScreenWidth(15)),
              Text(
                title!,
                style: TextStyle(
                  fontFamily: AppConstants.fontInterSemiBold,
                  color: AppConstants.clrBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(14),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
