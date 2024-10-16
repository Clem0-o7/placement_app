import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:placement_app/size_config.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/utils/database_service.dart';
import 'package:placement_app/widgets/button_widget.dart';
import 'package:placement_app/widgets/phone_country_field_without_title.dart';
import 'package:placement_app/widgets/textfield_without_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPassword = false;
  bool isLoading = false;

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();

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
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(20),
              ),
              decoration: BoxDecoration(
                color: const Color(0x9EFFFFFF),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                ),
                child: Form(
                  key: _formKey,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Create an account to continue!",
                        style: TextStyle(
                          color: AppConstants.greyColor4,
                          fontSize: getProportionateScreenWidth(13),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      _buildTextFields(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      _buildSignUpButton(),
                      SizedBox(height: getProportionateScreenHeight(20)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        TextfieldWithoutTitleWidget(
          controller: firstNameController,
          hintText: "Enter First Name",
          backgroundColor: AppConstants.clrBackground,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your first name";
            }
            return null;
          },
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextfieldWithoutTitleWidget(
          controller: lastNameController,
          hintText: "Enter Last Name",
          backgroundColor: AppConstants.clrBackground,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your last name";
            }
            return null;
          },
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextfieldWithoutTitleWidget(
          controller: emailController,
          hintText: "Enter Email",
          backgroundColor: AppConstants.clrBackground,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@')) {
              return "Please enter a valid email";
            }
            return null;
          },
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
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          obsecure: isPassword,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPassword = !isPassword;
              });
            },
            child: Icon(
              isPassword ? Icons.visibility : Icons.visibility_off,
              color: AppConstants.clrBlack,
            ),
          ),
          validator: (value) {
            if (value == null || value.length < 6) {
              return "Password must be at least 6 characters";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return ButtonWidget(
      title: isLoading ? "Signing Up..." : AppConstants.signUp,
      backgroundColor: AppConstants.mainColor,
      width: getProportionateScreenWidth(340),
      height: getProportionateScreenHeight(50),
      onTap: isLoading ? null : _registerUser,
    );
  }

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      isLoading = true;
    });

    try {
      // Create user account
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Save user data in Firebase Realtime Database
      await _databaseService.saveUserData(
        uid: userCredential.user!.uid,
        name: "${firstNameController.text} ${lastNameController.text}",
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
      );

      // Navigate to the login screen after successful signup
      Navigator.pushNamed(context, AppRoutes.loginScreen);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An unexpected error occurred: $e")),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
