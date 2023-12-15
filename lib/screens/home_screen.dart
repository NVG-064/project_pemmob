import 'package:flutter/material.dart';
import 'package:project_pemmob/pages/daftar_page.dart';
import 'package:project_pemmob/pages/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Image.asset(
          'assets/images/kota_tua.jpg',
        ),
        const SizedBox(height: 72),
        const Text(
          'ViewFatahillah',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color(0xffF05941),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: const Text('Masuk'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                // Pindah ke halaman DaftarPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DaftarPage(),
                  ),
                );
              },
              child: Text(
                'Tidak punya akun? Daftar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.blue, // Warna teks Daftar
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
