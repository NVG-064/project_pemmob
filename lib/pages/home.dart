import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Dummy data for the list of popular spots
  final List<Map<String, dynamic>> popularSpots = [
    {
      'image': 'assets/images/banner.jpg',
      'title': 'Taman Museum Fatahillah',
      'distance': '0 KM dari Museum Fatahillah',
      'description': 'Spot foto yang populer berada di depan museum fatahillah',
    },
    {
      'image': 'assets/images/museum_wayang.jpg',
      'title': 'Museum Wayang',
      'distance': '0,1 KM dari Museum Fatahillah',
      'description':
          'Museum Wayang dikenal sebagai tempat menyimpan koleksi wayang di Indonesia',
    },
    {
      'image': 'assets/images/museum_bi.jpg',
      'title': 'Museum Bank Indonesia',
      'distance': '0,2 KM dari Museum Fatahillah',
      'description':
          'Museum yang menampilkan sejarah perbankan lokal, termasuk mata uang antik & uang kertas internasional.',
    },
    {
      'image': 'assets/images/seni_rupa.jpg',
      'title': 'Museum Seni Rupa dan Keramik',
      'distance': '0,8 KM dari Museum Fatahillah',
      'description':
          'Museum seni rupa & keramik yang menampilkan kerajinan Indonesia dalam gedung istana abad ke-19',
    },
    {
      'image': 'assets/images/museum_mandiri.jpg',
      'title': 'Museum Mandiri',
      'distance': '0,8 KM dari Museum Fatahillah',
      'description':
          'Museum luas dengan koleksi barang & perlengkapan antik terkait sejarah perbankan nasional.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle notification button press
                    },
                    iconSize: 30.0,
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/banner.jpg',
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Spot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // List of cards below "Popular Spot"
            Expanded(
              child: ListView.builder(
                itemCount: popularSpots.length,
                itemBuilder: (context, index) {
                  return PopularSpotCard(
                    image: popularSpots[index]['image'],
                    title: popularSpots[index]['title'],
                    distance: popularSpots[index]['distance'],
                    description: popularSpots[index]['description'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSpotCard extends StatelessWidget {
  final String image;
  final String title;
  final String? distance; // Make distance nullable
  final String description;

  const PopularSpotCard({
    required this.image,
    required this.title,
    this.distance, // Make distance nullable
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Image on the left with padding
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                height: 100, // Adjust the height to maintain aspect ratio
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Information on the right
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        distance ?? 'Distance not available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    //textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
