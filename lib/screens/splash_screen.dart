import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_pemmob/auth_services.dart';
import 'package:project_pemmob/admin/gallery_admin.dart';
import 'package:project_pemmob/pages/home_page.dart';
import 'package:project_pemmob/admin/nav_admin.dart';
import 'package:project_pemmob/screens/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    AuthServices.setAuth = FirebaseAuth.instance;

    Future.delayed(const Duration(seconds: 3), () async {
      // Debug purposes
      print(
          "=====================================================================");
      print(
          "=====================================================================");
      print("current user: ${AuthServices.getAuth?.currentUser}");
      print(
          "=====================================================================");
      print(
          "=====================================================================");

      if (AuthServices.getAuth?.currentUser != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Kamu masuk sebagai ${AuthServices.getAuth!.currentUser?.email}'),
        ));

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => NavAdmin(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => NavAdmin(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image(image: AssetImage('assets/images/logo.png')),
            Image.asset(
              'assets/images/logo.png',
              width: 64,
            ),
            const SizedBox(height: 20),
            const Text(
              'ViewFatahillah',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
