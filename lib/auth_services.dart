import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_pemmob/admin/nav_admin.dart';
import 'package:project_pemmob/pages/home_page.dart';
import 'package:project_pemmob/pages/login_page.dart';
import 'package:project_pemmob/screens/home_screen.dart';

class AuthServices {
  static FirebaseAuth? _auth;
  // static User? _user;

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

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Selamat datang kembali ${AuthServices.getAuth!.currentUser?.email}'),
      ));

      // Navigate to the Home page
      if (context.mounted) {
        if (AuthServices.getAuth!.currentUser?.email == 'admin123@admin.mail') {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => NavAdmin(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => HomePage(),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email tidak valid'),
          ));
          break;
        case 'user-disabled':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Akun telah dinonaktifkan'),
          ));
          break;
        case 'user-not-found':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email tidak ditemukan'),
          ));
          break;
        case 'wrong-password':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email atau password salah'),
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

      final user = credentials?.user;
      if (user == null) {
        throw Exception('failed-to-sign-up');
      }

      print(
          "=====================================================================");
      print(
          "=====================================================================");
      print('Before setUserDisplayName: ${_auth?.currentUser}');

      setUserDisplayName(fullname);

      updateCurrentUser();
      // _auth?.authStateChanges();

      print('After setUserDisplayName: ${_auth?.currentUser}');
      print(
          "=====================================================================");
      print(
          "=====================================================================");

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Berhasil daftar'),
      ));

      // Navigate to the Home page
      if (context.mounted) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email telah digunakan'),
          ));
          break;
        case 'invalid-email':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Email tidak valid'),
          ));
          break;
        case 'weak-password':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Password terlalu lemah'),
          ));
          break;
        case 'failed-to-sign-up':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Gagal daftar'),
          ));
          break;
        case 'operation-not-allowed':
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Layanan Auth belum diaktifkan'),
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

        final user = userCredential?.user;

        // Debug purpose
        print(
            "=====================================================================");
        print(
            "=====================================================================");
        print("current user: ${_auth?.currentUser}");
        print("_user: $user");
        print(
            "=====================================================================");
        print(
            "=====================================================================");

        if (user == null) {
          throw Exception('sign-in-google-failed');
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selamat datang kembali ${AuthServices.getAuth!.currentUser?.email}'),
        ));

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
          case 'sign-in-google-failed':
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Failed to sign in with Google'),
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
    AuthServices.getAuth!.currentUser?.updateDisplayName(name);
  }

  static Future<void> updateCurrentUser() async {
    _auth = FirebaseAuth.instance;
  }

  // static Stream<User?>? get firebaseUserStream => _auth?.authStateChanges();
}
