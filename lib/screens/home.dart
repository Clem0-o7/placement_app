import 'package:flutter/material.dart';
import 'package:placement_app/routes/app_routes.dart'; // Updated package name
import 'package:placement_app/widgets/customize_drawer_screen.dart'; // Drawer widget
import 'package:placement_app/widgets/navigation_bar_widget.dart'; // Bottom navbar widget
import 'package:placement_app/size_config.dart'; // Size configuration
import 'package:placement_app/utils/constants.dart'; // Constants

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      drawer: const CustomizeDrawerScreen(), // Drawer widget
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      bottomNavigationBar: const NavigationBarWidget(), // Bottom navbar widget
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              AppConstants.ui9bg,
              fit: BoxFit.cover,
            ),
          ),
          // Content with padding and ListView
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: ListView(
              children: [
                // Example tiles with increased height and detailed content
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    title: Text(
                      'Upcoming Recruitment Drive',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Join the recruitment drive of TechCorp for software engineers. Date: 15th September.',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.grey[700],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: getProportionateScreenWidth(20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.companiesScreen);
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    title: Text(
                      'Career Fair 2024',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'A career fair with multiple companies participating. Date: 30th September.',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.grey[700],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: getProportionateScreenWidth(20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.companiesScreen);
                    },
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(15),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    title: Text(
                      'Workshop on Resume Building',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(20),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'A workshop to help you craft the perfect resume. Date: 10th October.',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.grey[700],
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: getProportionateScreenWidth(20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.feedbackScreen);
                    },
                  ),
                ),
                // Add more tiles with similar structure as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
