import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:placement_app/size_config.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/widgets/button_widget.dart';
import 'package:placement_app/widgets/social_button_widget.dart';
import 'package:placement_app/widgets/textfield_without_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isPassword = false;
  bool isChecked = false;

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamed(context, AppRoutes.homeScreen);
    } catch (e) {
      // Handle errors like incorrect password, user not found, etc.
      print("Login error: $e");
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
        Navigator.pushNamed(context, AppRoutes.homeScreen);
      }
    } catch (e) {
      // Handle errors
      print("Google sign-in error: $e");
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
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(60),
            ),
            width: getProportionateScreenWidth(340),
            decoration: BoxDecoration(
              color: Color(0x9EFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SvgPicture.asset(
                      AppConstants.placement,
                      width: getProportionateScreenWidth(30),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      AppConstants.login,
                      style: TextStyle(
                        color: AppConstants.clrBlack,
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Enter your email and password to log in",
                      style: TextStyle(
                        color: AppConstants.greyColor4,
                        fontSize: getProportionateScreenWidth(13),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: getProportionateScreenHeight(30)),
                    TextfieldWithoutTitleWidget(
                      controller: emailController,
                      hintText: "Enter Email",
                      backgroundColor: AppConstants.clrBackground,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    TextfieldWithoutTitleWidget(
                      controller: passwordController,
                      hintText: "Enter Password",
                      backgroundColor: AppConstants.clrBackground,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obsecure: !isPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off,
                          color: AppConstants.clrBlack,
                        ),
                        onPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                              activeColor: AppConstants.mainColor,
                            ),
                            Text(
                              "Remember Password",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppRoutes.forgetPassScreen);
                          },
                          child: Text(
                            AppConstants.forgotPassword,
                            style: TextStyle(
                              color: AppConstants.textBlue,
                              fontSize: getProportionateScreenWidth(13),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    ButtonWidget(
                      title: AppConstants.login,
                      backgroundColor: AppConstants.mainColor,
                      width: double.infinity,
                      height: getProportionateScreenHeight(50),
                      onTap: _signInWithEmailAndPassword,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppConstants.greyColor2,
                            thickness: 0.5,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                          ),
                          child: Text(
                            "Or Login With",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              color: AppConstants.greyColor4,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppConstants.greyColor2,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    // Centered Google Sign-in button
                    Center(
                      child: SocialButtonWidget(
                        icon: AppConstants.imgGoogle,
                        backgroundColor: AppConstants.clrBackground,
                        width: getProportionateScreenWidth(70),
                        height: getProportionateScreenHeight(50),
                        onTap: _signInWithGoogle,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    RichText(
                      text: TextSpan(
                        text: "If you don't have an account, ",
                        style: TextStyle(
                          color: AppConstants.greyColor4,
                          fontSize: getProportionateScreenWidth(13),
                        ),
                        children: [
                          TextSpan(
                            text: "Signup",
                            style: TextStyle(
                              color: AppConstants.textBlue,
                              fontSize: getProportionateScreenWidth(13),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, AppRoutes.signUpScreen);
                              },
                          ),
                        ],
                      ),
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
