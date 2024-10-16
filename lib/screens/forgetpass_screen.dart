import 'package:flutter/material.dart';
import 'package:placement_app/size_config.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/widgets/button_widget.dart';
import 'package:placement_app/widgets/textfield_without_title.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Password Reset"),
          content: Text("A password reset link has been sent to your email."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      // Handle errors
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error"),
          content: Text("Failed to send password reset email. Please try again."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
      print("Password reset error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppConstants.imgUi10Bg),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(40),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Reset Your Password",
                    style: TextStyle(
                      color: AppConstants.clrBlack,
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "Enter your email and we will send you a password reset link.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppConstants.greyColor4,
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  TextfieldWithoutTitleWidget(
                    controller: emailController,
                    hintText: "Enter Email",
                    backgroundColor: AppConstants.clrBackground,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  ButtonWidget(
                    title: "Reset Password",
                    backgroundColor: AppConstants.mainColor,
                    width: double.infinity,
                    height: getProportionateScreenHeight(50),
                    onTap: _resetPassword,
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back to Login",
                      style: TextStyle(
                        color: AppConstants.textBlue,
                        fontSize: getProportionateScreenWidth(14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
