import 'package:flutter/material.dart';

class GalleryAdmin extends StatefulWidget {
  const GalleryAdmin({Key? key}) : super(key: key);

  @override
  State<GalleryAdmin> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryAdmin> {
  List<String> album1Images = [
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
  ];

  List<String> album2Images = [
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
  ];

  List<String> album3Images = [
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
    'assets/images/banner.jpg',
    'assets/images/museum_bi.jpg',
    'assets/images/museum_mandiri.jpg',
  ];

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _addImage('Album 1');
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteImage('Album 1');
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                buildImageColumn('Album 1', album1Images),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _addImage('Album 2');
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteImage('Album 2');
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                buildImageColumn('Album 2', album2Images),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        _addImage('Album 3');
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        _deleteImage('Album 3');
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
                buildImageColumn('Album 3', album3Images),
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Image.asset(imagePath),
      ),
    );
  }

  void _addImage(String album) {
    setState(() {
      if (album == 'Album 1') {
        album1Images.add('assets/images/new_image.jpg');
      } else if (album == 'Album 2') {
        album2Images.add('assets/images/new_image.jpg');
      } else if (album == 'Album 3') {
        album3Images.add('assets/images/new_image.jpg');
      }
    });
  }

  void _deleteImage(String album) {
    setState(() {
      if (album == 'Album 1' && album1Images.isNotEmpty) {
        album1Images.removeLast();
      } else if (album == 'Album 2' && album2Images.isNotEmpty) {
        album2Images.removeLast();
      } else if (album == 'Album 3' && album3Images.isNotEmpty) {
        album3Images.removeLast();
      }
    });
  }
}
