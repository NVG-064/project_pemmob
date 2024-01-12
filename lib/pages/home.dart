import 'package:flutter/material.dart';
import 'package:project_pemmob/pages/virtual_tour.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> popularSpots = [
    {
      'image': 'assets/images/banner.jpg',
      'title': 'Taman Museum Fatahillah',
      'distance': '0 KM dari Museum Fatahillah',
      'description': 'Spot foto yang populer berada di depan museum fatahillah',
      'details_desc':
          'Taman Fatahillah (sebelumnya bernama Stadhuisplein) adalah sebuah lapangan yang berada di kawasan pusat Kota Tua Jakarta. Di tempat ini berdiri beberapa bangunan tua seperti bekas Balai Kota Jakarta (sekarang Museum Fatahillah), Museum Wayang, Kantor Pos Kota, dan bekas gedung Pengadilan Tinggi Batavia (sekarang Museum Seni Rupa dan Keramik). Tempat ini dinamakan Fatahillah, seorang tokoh yang berhasil merebut Sunda Kelapa dari tangan Portugis.',
    },
    {
      'image': 'assets/images/museum_wayang.jpg',
      'title': 'Museum Wayang',
      'distance': '0,1 KM dari Museum Fatahillah',
      'description':
          'Museum Wayang dikenal sebagai tempat menyimpan koleksi wayang di Indonesia',
      'details_desc':
          'Taman Fatahillah (sebelumnya bernama Stadhuisplein) adalah sebuah lapangan yang berada di kawasan pusat Kota Tua JAkarta. Di tempat ini berdiri beberapa bangunan tua seperti bekas Balai Kota Jakarta (sekarang Museum Fatahillah), Museum Wayang, Kantor Pos Kota, dan bekas gedung Pengadilan Tinggi Batavia (sekarang Museum Seni Rupa dan Keramik). Tempat ini dinamakan Fatahillah, seorang tokoh yang berhasil merebut Sunda Kelapa dari tangan Portugis.',
    },
    {
      'image': 'assets/images/museum_bi.jpg',
      'title': 'Museum Bank Indonesia',
      'distance': '0,2 KM dari Museum Fatahillah',
      'description':
          'Museum yang menampilkan sejarah perbankan lokal, termasuk mata uang antik & uang kertas internasional.',
      'details_desc':
          'Taman Fatahillah (sebelumnya bernama Stadhuisplein) adalah sebuah lapangan yang berada di kawasan pusat Kota Tua JAkarta. Di tempat ini berdiri beberapa bangunan tua seperti bekas Balai Kota Jakarta (sekarang Museum Fatahillah), Museum Wayang, Kantor Pos Kota, dan bekas gedung Pengadilan Tinggi Batavia (sekarang Museum Seni Rupa dan Keramik). Tempat ini dinamakan Fatahillah, seorang tokoh yang berhasil merebut Sunda Kelapa dari tangan Portugis.',
    },
    {
      'image': 'assets/images/seni_rupa.jpg',
      'title': 'Museum Seni Rupa dan Keramik',
      'distance': '0,8 KM dari Museum Fatahillah',
      'description':
          'Museum seni rupa & keramik yang menampilkan kerajinan Indonesia dalam gedung istana abad ke-19',
      'details_desc':
          'Taman Fatahillah (sebelumnya bernama Stadhuisplein) adalah sebuah lapangan yang berada di kawasan pusat Kota Tua JAkarta. Di tempat ini berdiri beberapa bangunan tua seperti bekas Balai Kota Jakarta (sekarang Museum Fatahillah), Museum Wayang, Kantor Pos Kota, dan bekas gedung Pengadilan Tinggi Batavia (sekarang Museum Seni Rupa dan Keramik). Tempat ini dinamakan Fatahillah, seorang tokoh yang berhasil merebut Sunda Kelapa dari tangan Portugis.',
    },
    {
      'image': 'assets/images/museum_mandiri.jpg',
      'title': 'Museum Mandiri',
      'distance': '0,8 KM dari Museum Fatahillah',
      'description':
          'Museum luas dengan koleksi barang & perlengkapan antik terkait sejarah perbankan nasional.',
      'details_desc':
          'Taman Fatahillah (sebelumnya bernama Stadhuisplein) adalah sebuah lapangan yang berada di kawasan pusat Kota Tua JAkarta. Di tempat ini berdiri beberapa bangunan tua seperti bekas Balai Kota Jakarta (sekarang Museum Fatahillah), Museum Wayang, Kantor Pos Kota, dan bekas gedung Pengadilan Tinggi Batavia (sekarang Museum Seni Rupa dan Keramik). Tempat ini dinamakan Fatahillah, seorang tokoh yang berhasil merebut Sunda Kelapa dari tangan Portugis.',
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                    iconSize: 28.0,
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
            Expanded(
              child: ListView.builder(
                itemCount: popularSpots.length,
                itemBuilder: (context, index) {
                  return PopularSpotCard(
                    image: popularSpots[index]['image'],
                    title: popularSpots[index]['title'],
                    distance: popularSpots[index]['distance'],
                    description: popularSpots[index]['description'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SpotDetailPage(
                            title: popularSpots[index]['title'],
                            imageAsset: popularSpots[index]['image'],
                            distance: popularSpots[index]['distance'] ??
                                'Distance not available',
                            details_desc: popularSpots[index]['details_desc'] ??
                                'Details not available',
                          ),
                        ),
                      );
                    },
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
  final String? distance;
  final String description;
  final VoidCallback onTap;

  const PopularSpotCard({
    super.key,
    required this.image,
    required this.title,
    this.distance,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  image,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          distance ?? 'Distance not available',
                          style: const TextStyle(
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
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Spot Detail Page

class SpotDetailPage extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String distance;
  final String details_desc;

  const SpotDetailPage({
    Key? key,
    required this.title,
    required this.imageAsset,
    required this.distance,
    required this.details_desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            imageAsset,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: CustomAppBar(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  child: Text(
                    details_desc,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 105, 105, 105),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Lokasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 16,
          height: 16,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0)),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0)),
          child: IconButton(
            icon: const Icon(
              Icons.view_in_ar,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const VirtualTour(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
