class PlanetInfo {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  PlanetInfo(
    this.position, {
    this.name,
    this.iconImage,
    this.description,
    this.images,
  });
}

List<PlanetInfo> planets = [
  PlanetInfo(
    1,
    name: 'Pharmacy',
    iconImage: 'assets/images/location.jpeg',
  ),
  PlanetInfo(
    2,
    name: 'Medicine',
    iconImage: 'assets/images/med.jpg',
  ),
  PlanetInfo(
    3,
    name: 'About Us',
    iconImage: 'assets/images/aboutus.png',
  ),
  PlanetInfo(
    4,
    name: 'Covid-19 BD',
    iconImage: 'assets/images/order.png',
  ),
];
