import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_pemmob/pages/virtual_tour.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String calculateDistance(lat2, long2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - -6.136331546647542) * p) / 2 +
        cos(-6.136331546647542 * p) *
            cos(lat2 * p) *
            (1 - cos((long2 - 106.8130446415108) * p)) /
            2;
    return (12742 * asin(sqrt(a))).toStringAsFixed(2);
  }

//it will return distance in KM

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
            Image.asset(
              'assets/images/banner.jpg',
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
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
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("spot").snapshots(),
                builder: (context, snapshot) {
                  return !snapshot.hasData
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot data = snapshot.data!.docs[index];
                            return PopularSpotCard(
                              image: popularSpots[index]['image'],
                              title: data['title'],
                              distance:
                                  '${calculateDistance(double.tryParse(data['lat']), double.tryParse(data['long']))} KM dari Museum Fatahillah',
                              description: data['desc'],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SpotDetailPage(
                                      title: data['title'],
                                      imageAsset: popularSpots[index]['image'],
                                      distance:
                                          '${calculateDistance(double.tryParse(data['lat']), double.tryParse(data['long']))} KM dari Museum Fatahillah',
                                      details_desc: data['about'] ??
                                          'Details not available',
                                      uri: data['uri'],
                                      lat: data['lat'],
                                      long: data['long'],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PopularSpotCard extends StatefulWidget {
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
  State<PopularSpotCard> createState() => _PopularSpotCardState();
}

class _PopularSpotCardState extends State<PopularSpotCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Image.asset(
                  widget.image,
                  height: 120,
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
                      widget.title,
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
                          widget.distance ?? 'Distance not available',
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
                      widget.description,
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
  final String uri;
  final String lat;
  final String long;
  final InfoWindow _infoWindow = const InfoWindow(
    title: "",
    snippet: "",
  );

  const SpotDetailPage(
      {Key? key,
      required this.title,
      required this.imageAsset,
      required this.distance,
      required this.details_desc,
      required this.uri,
      required this.lat,
      required this.long})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              imageAsset,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: CustomAppBar(uri: uri),
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
                  SizedBox(height: 16),
                  SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(double.parse(lat), double.parse(long)),
                        zoom: 14.0,
                      ),
                      mapType: MapType.normal,
                      markers: <Marker>{
                        Marker(
                            markerId: MarkerId("${_infoWindow.title}"),
                            position:
                                LatLng(double.parse(lat), double.parse(long)),
                            icon: BitmapDescriptor.defaultMarker,
                            infoWindow: _infoWindow)
                      },
                      onTap: (_) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String uri;

  const CustomAppBar({Key? key, required this.uri}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _CustomAppBarState extends State<CustomAppBar> {
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
              if (widget.uri.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VirtualTour(uri: widget.uri),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Tidak ada virtual tour untuk museum ini"),
                ));
              }
            },
          ),
        ),
      ],
    );
  }
}
