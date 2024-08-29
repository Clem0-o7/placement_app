import 'package:flutter/material.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:placement_app/screens/login.dart';
import 'package:placement_app/screens/signup.dart';
import 'package:placement_app/screens/home.dart';
import 'package:placement_app/screens/user_profile.dart';
import 'package:placement_app/screens/companies_screen.dart';
import 'package:placement_app/screens/feedback_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // Login and Sign Up Screens
  AppRoutes.loginScreen: (context) => Login(),
  AppRoutes.signUpScreen: (context) => SignupScreen(),
  AppRoutes.homeScreen: (context) => HomeScreen(),
  AppRoutes.profileScreen: (context) => ProfileScreen(),
  AppRoutes.companiesScreen: (context) => CompaniesScreen(),
  AppRoutes.feedbackScreen: (context) => FeedbackScreen(),
};
