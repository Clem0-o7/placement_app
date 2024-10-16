import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart'; // Import constants for mainColor
import 'package:placement_app/routes/app_routes.dart'; // Import AppRoutes

class CustomizeDrawerScreen extends StatelessWidget {
  const CustomizeDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppConstants.mainColor, // Use the main color from constants
            ),
            child: Text(
              'Campus Recruitment Organizer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold, // Added bold font weight for better styling
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.homeScreen);
            },
          ),
          ListTile(
            title: Text('Companies'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.companiesScreen);
            },
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.profileScreen);
            },
          ),
          ListTile(
            title: Text('Feedback'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.feedbackScreen);
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.feedbackScreen);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.red, // Red color for logout
              ),
            ),
            onTap: () {
              // Add logout functionality
            },
          ),
        ],
      ),
    );
  }
}
