import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/size_config.dart'; // SizeConfig import

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppConstants.ui9bg,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: getProportionateScreenWidth(60),
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWx5JTIwZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Sophia',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                Text(
                  '@sophia.com',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(30)),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add edit functionality here
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Profile'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                        vertical: getProportionateScreenHeight(15)),
                    textStyle: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
