// home_page.dart
import 'package:flutter/material.dart';
import 'package:project_pemmob/pages/gallery.dart';
import 'package:project_pemmob/pages/home.dart';
import 'package:project_pemmob/pages/profile.dart';
import 'ticket_page.dart'; // Import TicketPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages to be displayed
  final List<Widget> _pages = [
    const Home(),
    const TicketPage(),
    const GalleryPage(),
    const Profile(),
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
