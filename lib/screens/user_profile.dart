import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/size_config.dart';
import 'package:placement_app/routes/app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
  String name = '';
  String email = '';
  String phoneNumber = '';
  String profilePicUrl =
      'https://example.com/default_profile_pic.png'; // Default profile picture
  String cgpa = '';
  String semester = '';
  String department = ''; // New field for department
  bool isPlaced = false;
  String companyName = '';

  // Controllers for inputs
  final TextEditingController cgpaController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController departmentController =
      TextEditingController(); // Controller for department
  final TextEditingController companyNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        final snapshot = await _dbRef.child('users').child(user.uid).get();
        if (snapshot.exists) {
          final data = snapshot.value as Map;
          setState(() {
            name = data['name'] ?? '';
            email = data['email'] ?? '';
            phoneNumber = data['phoneNumber'] ?? '';
            profilePicUrl = data['profilePicUrl'] ?? profilePicUrl;
            cgpa = data['cgpa'] ?? '';
            semester = data['semester'] ?? '';
            department = data['department'] ?? ''; // Fetch department
            isPlaced = data['isPlaced'] ?? false;
            companyName = data['companyName'] ?? '';

            // Update controllers with fetched data
            cgpaController.text = cgpa;
            semesterController.text = semester;
            departmentController.text = department; // Set department controller
            companyNameController.text = companyName;
          });
        }
      } catch (e) {
        print("Error fetching user profile: $e");
      }
    }
  }

  Future<void> _saveProfile() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        // Create or update the user profile
        await _dbRef.child('users').child(user.uid).set({
          'name': name,
          'email': email,
          'phoneNumber': phoneNumber,
          'profilePicUrl': profilePicUrl,
          'cgpa': cgpaController.text,
          'semester': semesterController.text,
          'department': departmentController.text, // Save department
          'isPlaced': isPlaced,
          'companyName': isPlaced ? companyNameController.text : null,
        });
        // Handle successful save
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')),
        );
      } catch (e) {
        // Display an error message if saving fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppConstants.ui9bg,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                // Add scrolling for smaller screens
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: getProportionateScreenWidth(60),
                      backgroundImage: NetworkImage(profilePicUrl),
                      onBackgroundImageError: (_, __) =>
                          AssetImage(AppConstants.defaultProfilePic),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      name.isNotEmpty ? name : 'User Name',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      email.isNotEmpty ? email : '@example.com',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Text(
                      phoneNumber.isNotEmpty ? phoneNumber : 'Phone Number',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    TextField(
                      controller: departmentController, // Department input
                      decoration: InputDecoration(labelText: 'Department'),
                      onChanged: (value) {
                        setState(() {
                          department = value;
                        });
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    TextField(
                      controller: cgpaController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(labelText: 'CGPA'),
                      onChanged: (value) {
                        setState(() {
                          cgpa = value;
                        });
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    TextField(
                      controller: semesterController,
                      decoration: InputDecoration(labelText: 'Semester'),
                      onChanged: (value) {
                        setState(() {
                          semester = value;
                        });
                      },
                    ),
                    SizedBox(height: getProportionateScreenHeight(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isPlaced,
                          onChanged: (value) {
                            setState(() {
                              isPlaced = value!;
                              // Reset company name if checkbox is unchecked
                              if (!isPlaced) {
                                companyNameController.clear();
                              }
                            });
                          },
                        ),
                        Text('Placed'),
                      ],
                    ),
                    if (isPlaced) ...[
                      TextField(
                        controller: companyNameController,
                        decoration: InputDecoration(labelText: 'Company Name'),
                        onChanged: (value) {
                          setState(() {
                            companyName = value;
                          });
                        },
                      ),
                    ],
                    SizedBox(height: getProportionateScreenHeight(30)),
                    ElevatedButton.icon(
                      onPressed: () {
                        _saveProfile(); // Save profile changes
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save Profile'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(30),
                          vertical: getProportionateScreenHeight(15),
                        ),
                        textStyle: TextStyle(
                            fontSize: getProportionateScreenWidth(16)),
                        backgroundColor: AppConstants.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when no longer needed
    cgpaController.dispose();
    semesterController.dispose();
    departmentController.dispose(); // Dispose of the department controller
    companyNameController.dispose();
    super.dispose();
  }
}
