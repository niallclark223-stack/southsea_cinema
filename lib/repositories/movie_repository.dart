import '../models/movies.dart';

class MoviesRepository {
  List<Movies> getMovies() {
    return const [
      Movies(
        id: 'deadpool-vs-wolverine',
        name: 'Deadpool vs wolverine',
        age_rating: '15',
        description: 'they hate eachother',
        length: '128',
        image_path: 'assets/images/deadpool_vs_wolverine.jpg',
        ticket_price: 5.0,
      ),
      Movies(
        id: 'ali-g',
        name: 'Ali G, who iz i',
        age_rating: '18',
        description: 'borat',
        length: '110',
        image_path: 'assets/images/ali_g.jpg',
        ticket_price: 5.0,
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