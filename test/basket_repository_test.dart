import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

void main() {
  const Movies movie = Movies(
    id: 'test-movie',
    name: 'Test Movie',
    ageRating: 'PG',
    description: 'A test movie.',
    length: '100',
    imagePath: 'assets/images/test.jpg',
    ticketPrice: 5.0,
  );

  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository', () {
    test('adds a ticket and calculates the total', () {
      BasketRepository.instance.addItem(movie, quantity: 2);

      expect(BasketRepository.instance.getItems().length, 1);
      expect(BasketRepository.instance.total, 10.0);
    });

    test('adding the same film again increases the quantity', () {
      BasketRepository.instance.addItem(movie);
      BasketRepository.instance.addItem(movie, quantity: 2);

      expect(BasketRepository.instance.getItems().length, 1);
      expect(BasketRepository.instance.getItems().first.quantity, 3);
    });

    test('removes a film from the basket', () {
      BasketRepository.instance.addItem(movie);
      BasketRepository.instance.removeItem('test-movie');

      expect(BasketRepository.instance.getItems(), isEmpty);
    });

    test('clear empties the basket', () {
      BasketRepository.instance.addItem(movie, quantity: 4);
      BasketRepository.instance.clear();

      expect(BasketRepository.instance.getItems(), isEmpty);
      expect(BasketRepository.instance.total, 0);
    });
  });
}