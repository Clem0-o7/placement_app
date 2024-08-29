import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/routes/app_routes.dart'; // Updated route imports

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends State<NavigationBarWidget> {
  int currentPageIndex = 1; // Default index to match the Home screen

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });

        // Handle navigation based on the index
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoutes.companiesScreen);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.homeScreen);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoutes.feedbackScreen);
            break;
        }
      },
      indicatorColor: AppConstants.mainColor,
      selectedIndex: currentPageIndex,
      destinations: <NavigationDestination>[
        // Companies on the left
        NavigationDestination(
          icon: const Icon(Icons.business),
          label: 'Companies',
        ),
        // Home in the center
        NavigationDestination(
          selectedIcon: const Icon(Icons.home),
          icon: const Icon(Icons.home_outlined),
          label: 'Home',
        ),
        // Feedback on the right (mock button)
        NavigationDestination(
          icon: const Icon(Icons.feedback),
          label: 'Feedback',
        ),
      ],
    );
  }
}
