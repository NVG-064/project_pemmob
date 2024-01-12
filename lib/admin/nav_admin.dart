// home_page.dart
import 'package:flutter/material.dart';
import 'package:project_pemmob/admin/gallery_admin.dart';

class NavAdmin extends StatefulWidget {
  const NavAdmin({Key? key}) : super(key: key);

  @override
  State<NavAdmin> createState() => _NavAdminState();
}

class _NavAdminState extends State<NavAdmin> {
  int _selectedIndex = 0;

  // List of pages to be displayed
  final List<Widget> _pages = [
    const Text('Ini halaman Home'),
    const Text('Ini halaman Tiket'),
    const GalleryAdmin(),
    const Text('Ini halaman Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: const Color(0xffF05941),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Display the selected page
    );
  }
}
