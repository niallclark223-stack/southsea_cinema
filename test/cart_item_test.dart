import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';

void main() {
  test('lineTotal multiplies ticket price by quantity', () {
    const movie = Movies(
      id: 'test-movie',
      name: 'Test Movie',
      ageRating: 'PG',
      description: 'A test movie.',
      length: '100',
      imagePath: 'assets/images/test.jpg',
      ticketPrice: 5.0,
    );

    const item = CartItem(movie: movie, quantity: 3);

    expect(item.lineTotal, 15.0);
  });
}