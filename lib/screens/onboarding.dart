import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: 2,
          itemBuilder: (_, i) {
            return Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/tour_virtual.png',
                    height: 300,
                  ),
                  const Text(
                    'Tour Virtual',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Melihat koleksi Museum Fatahillah tanpa harus berada di lokasi fisik, dan dapat menjelajahi berbagai  fasilitas lainnya dengan cara yang realistis',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 128, 126, 126),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
