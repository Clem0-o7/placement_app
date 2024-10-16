import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:placement_app/firebase_options.dart'; // Import the DefaultFirebaseOptions

class DatabaseService {
  // Explicit reference to the Realtime Database URL
  final DatabaseReference _dbRef = FirebaseDatabase.instance.refFromURL(DefaultFirebaseOptions.databaseUrl);

  // User data path constant
  static const String userDataPath = 'users';

  // Method to add or update user information
  Future<void> saveUserData({
    required String uid,
    required String name,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      await _dbRef.child(userDataPath).child(uid).set({
        'name': name,
        'email': email,
        'phoneNumber': phoneNumber,
      });
      debugPrint("User data saved successfully for UID: $uid");
    } catch (e) {
      debugPrint("Error saving user data: $e");
      rethrow; // Optional: Rethrow the error if you want the calling code to handle it
    }
  }

  // Method to retrieve user information
  Future<Map<String, dynamic>?> getUserData(String uid) async {
    try {
      final DataSnapshot snapshot = await _dbRef.child(userDataPath).child(uid).get();
      if (snapshot.exists) {
        return Map<String, dynamic>.from(snapshot.value as Map);
      } else {
        debugPrint("User data not found for UID: $uid");
      }
    } catch (e) {
      debugPrint("Error retrieving user data: $e");
    }
    return null;
  }

  // Method to update a specific field in the user data
  Future<void> updateUserField(String uid, String field, dynamic value) async {
    try {
      await _dbRef.child(userDataPath).child(uid).update({
        field: value,
      });
    } catch (e) {
      debugPrint("Error updating user field: $e");
    }
  }
}
