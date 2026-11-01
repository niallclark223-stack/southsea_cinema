import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';

void main() {
  group('Movies model tests', () {
    test('creates Movies instance with given properties', () {
      const movie = Movies(
        id: 'test-movie',
        name: 'Test Movie',
        description: 'A test movie synopsis.',
        age_rating: 'PG',
        length: '100 mins',
        ticket_price: 7.50,
        image_path: 'assets/images/test.jpg',
      );

      expect(movie.id, 'test-movie');
      expect(movie.name, 'Test Movie');
      expect(movie.description, 'A test movie synopsis.');
      expect(movie.age_rating, 'PG');
      expect(movie.length, '100 mins');
      expect(movie.ticket_price, 7.50);
      expect(movie.image_path, 'assets/images/test.jpg');
    });

    test('formats ticket prices to two decimal places', () {
      const wholePoundMovie = Movies(
        id: 'whole-pound',
        name: 'Whole Pound Movie',
        description: 'Test synopsis.',
        age_rating: 'PG',
        length: '90 mins',
        ticket_price: 7.00,
        image_path: 'assets/images/test.jpg',
      );

      const penceMovie = Movies(
        id: 'with-pence',
        name: 'Pence Movie',
        description: 'Test synopsis.',
        age_rating: 'PG',
        length: '95 mins',
        ticket_price: 7.50,
        image_path: 'assets/images/test.jpg',
      );

      expect(wholePoundMovie.formattedPrice, '£7.00');
      expect(penceMovie.formattedPrice, '£7.50');
    });
  });
}