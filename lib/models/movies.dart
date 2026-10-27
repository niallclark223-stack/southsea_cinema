import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

class Movies {
  final String id;
  final String name;
  final String age_rating;
  final String description;
  final String image_path;
  final Double ticket_price;

  const Movies({
    required this.id,
    required this.name,
    required this.age_rating,
    required this.description,
    required this.image_path,
    required this.ticket_price,
  });
}

