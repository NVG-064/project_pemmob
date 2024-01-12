import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: Text(
                    'Museum Fatahillah',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 28),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                SizedBox(height: 20),
                buildImageColumn(
                  'Album 1',
                  [
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                  ],
                ),
                SizedBox(height: 20),
                buildImageColumn(
                  'Album 2',
                  [
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                  ],
                ),
                SizedBox(height: 20),
                buildImageColumn(
                  'Album 3',
                  [
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                    'assets/images/banner.jpg',
                    'assets/images/museum_bi.jpg',
                    'assets/images/museum_mandiri.jpg',
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageColumn(String title, List<String> imagePaths) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle image tap (e.g., navigate to a new screen with a larger view)
                _showImageDetails(imagePaths[index]);
              },
              child: Image.asset(
                imagePaths[index],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }

  void _showImageDetails(String imagePath) {
    // Implement your logic to show a larger view of the tapped image
    // You can use Navigator to navigate to a new screen or showDialog to show a modal.
    // For example:
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Image.asset(imagePath),
      ),
    );
  }
}
