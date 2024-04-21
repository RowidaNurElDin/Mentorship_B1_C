class Rocket {
  final String name;
  final String description;
  final String imageUrl;
  final DateTime date;

  Rocket({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.date,
  });
}
final Rocket rocket = Rocket(
  name: 'Falcon 9',
  date: DateTime.now(),
  description:
  'The Falcon 9 is a partially reusable two-stage-to-orbit medium-lift launch vehicle designed and manufactured by SpaceX.',
  imageUrl: 'https://via.placeholder.com/300',
);