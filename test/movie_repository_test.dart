import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  test('getMovieById returns matching movie when id exists', () {
  final MoviesRepository repository = MoviesRepository();
  final Movies? movie = repository.getMovieById('ali-g');

  expect(movie, isNotNull);
  expect(movie?.name, 'ali g who iz i');
  expect(movie?.ticketPrice, 5.0);
  });

  test('getMovieById returns null when id does not exist', () {
  final MoviesRepository repository = MoviesRepository();
  final Movies? movie = repository.getMovieById('non-existent');

  expect(movie, isNull);
  });
}