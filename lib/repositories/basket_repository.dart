import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/models/movies.dart';

class BasketRepository {
  BasketRepository._();

  static final BasketRepository instance = BasketRepository._();

  final List<CartItem> _items = [];

  List<CartItem> getItems() {
    return List.unmodifiable(_items);
  }

  void addItem(Movies movie, {int quantity = 1}) {
    final int index = _items.indexWhere((item) => item.movie.id == movie.id);
    if (index == -1) {
      _items.add(CartItem(movie: movie, quantity: quantity));
    } else {
      final int newQuantity = _items[index].quantity + quantity;
      _items[index] = CartItem(movie: movie, quantity: newQuantity);
    }
  }

  void removeItem(String movieId) {
    _items.removeWhere((item) => item.movie.id == movieId);
  }

  void clear() {
    _items.clear();
  }

  double get total {
    double sum = 0;
    for (final item in _items) {
      sum += item.lineTotal;
    }
    return sum;
  }
}