import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserStore with ChangeNotifier {
  bool _isLoggedIn = false;
  String _email = '';
  String _name = '';
  String _password = '';
  String _mobile = '';

  bool get isLoggedIn => _isLoggedIn;
  String get email => _email;
  String get password => _password;
  String get name => _name;
  String get mobile => _mobile;

  void register(
      String name, String email, String mobile, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // Get the current user's Firebase UID
      String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      print("User is registered with Firebase UID: $uid");
      // Create a new document in the "users" collection with the user's UID as the document ID
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'mobile': mobile,
        'firebaseAuthId': uid,
        'lastLoginAt': DateTime.now(),
      });

      // Update user store properties
      _isLoggedIn = true;
      _email = email;
      _name = name;
      _mobile = mobile;
      notifyListeners();
    } catch (error) {
      print("Error in authentication: $error");
    }
  }

Future<bool> login(String enteredEmail, String enteredPassword) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: enteredEmail,
      password: enteredPassword,
    );

    // Fetch user data from Firestore based on the logged-in user's UID
    String uid = userCredential.user?.uid ?? '';
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (userSnapshot.exists) {
      Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
      _isLoggedIn = true;
      _email = userData['email'] ?? '';
      _name = userData['name'] ?? '';
      _mobile = userData['mobile'] ?? '';
      notifyListeners();
      return true;
    } else {
      print("User data does not exist in Firestore for UID: $uid");
      return false;
    }
  } catch (error) {
    print("Error in login: $error");
    return false;
  }
}

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('user is signed out successfully');
      _isLoggedIn = false;
      notifyListeners();
    } catch (error) {
      print("Error while signing out: $error");
    }
  }
}
