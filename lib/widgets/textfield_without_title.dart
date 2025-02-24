import 'package:flutter/material.dart';
import 'package:placement_app/size_config.dart';
import '../utils/constants.dart';

class TextfieldWithoutTitleWidget extends StatelessWidget {
  const TextfieldWithoutTitleWidget({
    Key? key,
    required this.controller,
    this.keyboardType,
    this.textInputAction,
    this.hintText,
    this.suffixIcon,
    this.obsecure,
    this.backgroundColor,
    this.validator,  // Added validator parameter
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? obsecure;
  final Color? backgroundColor;
  final String? Function(String?)? validator; // Validator function type

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppConstants.clrBackground,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          width: 1,
          color: AppConstants.greyColor1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: getProportionateScreenWidth(14)),
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obsecure ?? false,
        validator: validator, // Use the validator here
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          suffixIcon: suffixIcon ?? SizedBox(),
          hintText: hintText ?? '',
          hintStyle: TextStyle(fontSize: getProportionateScreenWidth(14)),
          fillColor: AppConstants.greyColor,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppConstants.greyColor2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppConstants.clrBlack)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppConstants.greyColor2)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppConstants.clrRed)),
        ),
        textInputAction: textInputAction ?? TextInputAction.next,
      ),
    );
  }
}
