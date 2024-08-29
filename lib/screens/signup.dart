import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:placement_app/size_config.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/widgets/button_widget.dart';
import 'package:placement_app/widgets/phone_country_field_without_title.dart';
import 'package:placement_app/widgets/textfield_without_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  AppConstants.imgUi10Bg,
                ),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(20),
              ),
              decoration: BoxDecoration(
                color: Color(0x9EFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      AppConstants.signUp,
                      style: TextStyle(
                          color: AppConstants.clrBlack,
                          fontSize: getProportionateScreenWidth(30),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Create an account to continue!",
                      style: TextStyle(
                          color: AppConstants.greyColor4,
                          fontSize: getProportionateScreenWidth(13),
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    TextfieldWithoutTitleWidget(
                      controller: firstNameController,
                      hintText: "Enter First Name",
                      backgroundColor: AppConstants.clrBackground,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    TextfieldWithoutTitleWidget(
                      controller: lastNameController,
                      hintText: "Enter Last Name",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      backgroundColor: AppConstants.clrBackground,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    TextfieldWithoutTitleWidget(
                      controller: emailController,
                      hintText: "Enter Email",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      backgroundColor: AppConstants.clrBackground,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    TextfieldWithoutTitleWidget(
                      controller: dobController,
                      hintText: "e.g., 14/10/1997",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      backgroundColor: AppConstants.clrBackground,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    PhoneTextFieldWithoutTitle(
                      countryCode1: '+91',
                      mobileNoCont: phoneNumberController,
                      backgroundColor: AppConstants.clrBackground,
                      width: getProportionateScreenWidth(340),
                      height: getProportionateScreenHeight(50),
                      title: AppConstants.phoneNumber,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    TextfieldWithoutTitleWidget(
                      controller: passwordController,
                      hintText: "Enter Password",
                      backgroundColor: AppConstants.clrBackground,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      obsecure: isPassword,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          child: Icon(
                              isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppConstants.clrBlack)),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    ButtonWidget(
                      title: AppConstants.signUp,
                      backgroundColor: AppConstants.mainColor,
                      width: getProportionateScreenWidth(340),
                      height: getProportionateScreenHeight(50),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
