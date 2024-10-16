import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/routes.dart';
import 'package:placement_app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placement_app/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of the application
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
