import '../models/movies.dart';

class MoviesRepository {
  List<Movies> getMovies() {
    return const [
      Movies(
        id: 'film',
        name: 'Deadpool vs wolverine',
        age_rating: '15',
        description: 'they hate eachother',
        image_path: 'assets/images/deadpool_vs_wolverine.jpg',
        ticket_price: 5.0,
      ),
      Movies(
        id: 'film',
        name: 'Ali G, who iz i',
        age_rating: '18',
        description: 'borat',
        image_path: 'assets/images/ali_g.jpg',
        ticket_price: 5.0,
      ),
    ];
  }
}
