import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  String _confirmationMessage = '';

  void _remove(String movieId) {
    setState(() {
      BasketRepository.instance.removeItem(movieId);
    });
  }

  void _checkout() {
    setState(() {
      BasketRepository.instance.clear();
      _confirmationMessage = 'Booking confirmed. Thank you!';
    });
  }

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<CartItem> items = basket.getItems();

    final Widget content;
    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          children: [
            const Text('Your basket is empty'),
            const SizedBox(height: 8),
            Text(_confirmationMessage),
          ],
        );
      } else {
        content = const Text('Your basket is empty');
      }
    } else {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final CartItem item in items)
            ListTile(
              title: Text(item.movie.name),
              subtitle: Text(
                '${item.quantity} x ${item.movie.formattedPrice}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('£${item.lineTotal.toStringAsFixed(2)}'),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _remove(item.movie.id),
                  ),
                ],
              ),
            ),
          const Divider(),
          Text(
            'Total: £${basket.total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          PrimaryButton(label: 'Checkout', onPressed: _checkout),
        ],
      );
    }

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('My Basket'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),
    );
  }
}