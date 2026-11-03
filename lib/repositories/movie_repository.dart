// import '../models/movies.dart';
import 'package:southsea_cinema/models/movies.dart';

class MoviesRepository {
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