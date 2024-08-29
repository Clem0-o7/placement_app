import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/routes.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:placement_app/screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Placement App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppConstants.clrBackground,
        fontFamily: "Inter",
        textTheme: TextTheme(
          bodySmall: TextStyle(color: AppConstants.clrBlack),
          bodyLarge: TextStyle(color: AppConstants.clrBlack),
          bodyMedium: TextStyle(color: AppConstants.clrBlack),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.loginScreen,
      routes: routes,
    );
  }
}
