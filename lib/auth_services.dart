import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_pemmob/pages/home_page.dart';

class AuthServices {
  AuthServices() {
    _auth = FirebaseAuth.instance;
  }
  static var _auth;

  static Future<void> signOut(BuildContext context) async {
    print(
        "=====================================================================");
    print(
        "=====================================================================");
    print('Before sign out: ${_auth.currentUser}');
    _auth.signOut();
    print('After sign out: ${_auth.currentUser}');
    print(
        "=====================================================================");
    print(
        "=====================================================================");
  }

  static Future<void> signInFirebase(
      String email, String password, BuildContext context) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // Debug purpose
      print("current user: ${_auth.currentUser}");

      final user = credentials.user;
      if (user == null) {
        throw FirebaseAuthException(code: 'user-not-found');
      }

      // Navigate to the Home page
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Please enter a valid email'),
          ));
          break;
        case 'user-disabled':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Account has been disabled'),
          ));
          break;
        case 'user-not-found':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email doesn\'t exist'),
          ));
          break;
        case 'wrong-password':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Incorrect email or password'),
          ));
          break;
        default:
          rethrow;
      }
    }
  }

  static Future<void> signUpFirebase(
      String email, String password, BuildContext context) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Debug purpose
      print(
          "=====================================================================");
      print(
          "=====================================================================");
      print("current user: ${_auth.currentUser}");
      print(
          "=====================================================================");
      print(
          "=====================================================================");

      final user = credentials.user;
      if (user == null) {
        throw Exception('Failed to register user');
      }

      // Navigate to the Home page
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
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

  static FirebaseAuth? get getAuth {
    return _auth;
  }

  static set setAuth(FirebaseAuth auth) {
    _auth = auth;
  }

  // static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
