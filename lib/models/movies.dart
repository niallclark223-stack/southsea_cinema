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

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      id: json['id'] as String,
      name: json['name'] as String,
      ageRating: json['age_rating'] as String,
      description: json['description'] as String,
      imagePath: json['image_path'] as String,
      length: json['length'] as String,
      ticketPrice: (json['ticket_price'] as num).toDouble(),
    );
  }
  
  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';
}
