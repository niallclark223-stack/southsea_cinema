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
      id: json['id'].toString(),
      name: json['name'].toString(),
      ageRating: (json['age_rating'] ?? json['ageRating']).toString(),
      description: json['description'].toString(),
      imagePath: (json['image_path'] ?? json['imagePath']).toString(),
      length: json['length'].toString(),
      ticketPrice:
          ((json['ticket_price'] ?? json['ticketPrice']) as num).toDouble(),
    );
  }

  String get formattedPrice => '£${ticketPrice.toStringAsFixed(2)}';
}