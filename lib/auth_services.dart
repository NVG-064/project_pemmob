import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_pemmob/pages/home_page.dart';
import 'package:project_pemmob/pages/login_page.dart';

class AuthServices {
  static FirebaseAuth? _auth;
  static User? _user;

  AuthServices() {
    _auth = FirebaseAuth.instance;
  }

  static Future<void> signOut(BuildContext context) async {
    print(
        "=====================================================================");
    print(
        "=====================================================================");
    print('Before sign out: ${_auth?.currentUser}');
    await _auth?.signOut();

    updateCurrentUser();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));

    print('After sign out: ${_auth?.currentUser}');
    print(
        "=====================================================================");
    print(
        "=====================================================================");
  }

  static Future<void> signInFirebase(
      String email, String password, BuildContext context) async {
    try {
      final credentials = await _auth?.signInWithEmailAndPassword(
          email: email, password: password);

      // Debug purpose
      print("current user: ${_auth?.currentUser}");

      final user = credentials?.user;
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

  static Future<void> signUpFirebase(String fullname, String email,
      String password, BuildContext context) async {
    try {
      final credentials = await _auth?.createUserWithEmailAndPassword(
          email: email, password: password);

      _user = credentials?.user;
      if (_user == null) {
        throw Exception('Failed to register user');
      }

      setUserDisplayName(fullname);

      // updateCurrentUser();
      _auth?.userChanges;

      // Debug purpose
      print(
          "=====================================================================");
      print(
          "=====================================================================");
      print("current user: ${_user}");
      print(
          "=====================================================================");
      print(
          "=====================================================================");

      // Navigate to the Home page
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Welcome ${_user?.displayName} (${_user?.email})'),
      ));
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

  static Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential? userCredential =
            await _auth?.signInWithCredential(credential);

        _user = userCredential?.user;

        // Debug purpose
        print(
            "=====================================================================");
        print(
            "=====================================================================");
        print("current user: ${_auth?.currentUser}");
        print("_user: $_user");
        print(
            "=====================================================================");
        print(
            "=====================================================================");

        if (_user == null) {
          throw Exception('Failed to Signing In using Google');
        }

        // Navigate to the Home page
        if (context.mounted) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case 'account-exists-with-different-credential':
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Account exists with different credential'),
            ));
            break;
          case 'invalid-credential':
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Invalid credential'),
            ));
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.code.toString()),
            ));
          // if (e.code == 'account-exists-with-different-credential') {
          //   // handle the error here
          // }
          // else if (e.code == 'invalid-credential') {
          //   // handle the error here
          // }
        }
      }
    }
  }

  static Future<void> setUserDisplayName(String name) async {
    _user?.updateDisplayName(name);
  }

  static Future<void> updateCurrentUser() async {
    _auth = FirebaseAuth.instance;
    _user = _auth?.currentUser;
  }

  // static Stream<User?>? get firebaseUserStream => _auth?.authStateChanges();
}
