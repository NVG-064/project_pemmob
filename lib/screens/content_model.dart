class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Tour Virtual',
    image: 'assets/images/tour_virtual.png',
    description:
        "Melihat koleksi Museum Fatahillah tanpa harus berada di lokasi fisik, dan dapat menjelajahi berbagai  fasilitas lainnya dengan cara yang realistis",
  ),
  OnboardingContent(
    title: 'Rute Tour',
    image: 'assets/images/rute_tour.png',
    description:
        "Rute Tour memandu Anda dalam menemukan rute perjalanan ke destinasi wisata yang Anda tuju",
  ),
];
