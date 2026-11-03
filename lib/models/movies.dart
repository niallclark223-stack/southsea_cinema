class Movies {
  final String id;
  final String name;
  final String ageRating;
  final String description;
  final String imagePath;
  final String length;
  final double ticketPrice;

  const Movies({
    required this.id,
    required this.name,
    required this.ageRating,
    required this.description,
    required this.imagePath,
    required this.length,
    required this.ticketPrice,
  });
  
  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';
}
