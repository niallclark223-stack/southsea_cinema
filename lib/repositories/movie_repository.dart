import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/movies.dart';

class MoviesRepository {
  Future<List<Movies>> loadMovies() async {
    final String raw = await rootBundle.loadString('assets/data/movies.json');
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    final List<Movies> movies = [];

    for (final item in decoded) {
      movies.add(Movies.fromJson(item as Map<String, dynamic>));
    }

    return movies;
  }

  List<Movies> getMovies() {
    return const [
      Movies(
        id: 'deadpool-vs-wolverine',
        name: 'Deadpool vs wolverine',
        ageRating: '15',
        description: 'they hate eachother',
        length: '128',
        imagePath: 'assets/images/deadpool_vs_wolverine.jpg',
        ticketPrice: 5.0,
      ),
      Movies(
        id: 'ali-g',
        name: 'Ali G, who iz i',
        ageRating: '18',
        description: 'borat',
        length: '110',
        imagePath: 'assets/images/ali_g.jpg',
        ticketPrice: 5.0,
      ),
    ];
  }

  Movies? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}