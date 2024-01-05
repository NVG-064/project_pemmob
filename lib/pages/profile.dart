import 'package:flutter/material.dart';
import 'package:project_pemmob/auth_services.dart';
import 'package:project_pemmob/pages/edit_profile.dart';
import 'package:project_pemmob/pages/history.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Profile',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 48,
                ),
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'assets/images/profile.jpeg'), // Gantilah dengan path atau URL gambar profil Anda
                ),
                const SizedBox(height: 20),
                const Text(
                  'Jessica Aurelia',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: 400,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EditProfile(), // Replace YourNextScreen with the actual screen/widget you want to navigate to
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color(0xffF05941), // Warna border
                        width: 1.0, // Ketebalan border
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.mode_edit_outlined,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              History(), // Replace YourNextScreen with the actual screen/widget you want to navigate to
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color(0xffF05941), // Warna border
                        width: 1.0, // Ketebalan border
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Riwayat Pembelian Tiket',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi yang akan dijalankan ketika tombol ditekan
                      print('Tombol ditekan!');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color(0xffF05941), // Warna border
                        width: 1.0, // Ketebalan border
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Ganti Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 400,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi yang akan dijalankan ketika tombol ditekan
                      AuthServices.signOut(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: const BorderSide(
                        color: Color(0xffF05941), // Warna border
                        width: 1.0, // Ketebalan border
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
