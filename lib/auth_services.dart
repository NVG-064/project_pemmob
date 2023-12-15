import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_pemmob/screens/home_screen.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signOut() async {
    print('Before sign out: ${_auth.currentUser}');
    _auth.signOut();
    print('After sign out: ${_auth.currentUser}');
  }

  static Future<void> signUpFirebase(
      String email, String password, BuildContext context) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Debug purpose
      print("current user: ${_auth.currentUser}");

      final user = credentials.user;
      if (user == null) {
        throw Exception('Failed to register user');
      }

      // Navigate to the Home page
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'username-already-in-use':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Username is already taken'),
          ));
          break;
        case 'email-already-in-use':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email address is already taken'),
          ));
          break;
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please enter a valid email'),
          ));
          break;
        case 'weak-password':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Password is too weak'),
          ));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.code.toString()),
          ));
      }
    }
  }

  static FirebaseAuth? get auth {
    _auth;
  }

  // static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
