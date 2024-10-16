import 'package:flutter/material.dart';
import 'package:placement_app/utils/constants.dart';
import 'package:placement_app/size_config.dart'; // Importing SizeConfig

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // Initialize SizeConfig
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',
            style: TextStyle(color: AppConstants.clrBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(
            getProportionateScreenWidth(16)), // Use SizeConfig for padding
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            // Make the form scrollable
            child: Column(
              children: <Widget>[
                // Name Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: AppConstants.clrBlack),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppConstants.mainColor),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(
                    height: getProportionateScreenHeight(
                        20)), // Use SizeConfig for spacing

                // Email Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: AppConstants.clrBlack),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppConstants.mainColor),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(
                    height: getProportionateScreenHeight(
                        20)), // Use SizeConfig for spacing

                // Phone Field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(color: AppConstants.clrBlack),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppConstants.mainColor),
                    ),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                SizedBox(
                    height: getProportionateScreenHeight(
                        20)), // Use SizeConfig for spacing

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Here you can call your method to save the updated profile data to Firebase

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Profile updated')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(30),
                      vertical: getProportionateScreenHeight(15),
                    ),
                    backgroundColor: AppConstants.mainColor, // Button color
                    textStyle:
                        TextStyle(fontSize: getProportionateScreenWidth(16)),
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
