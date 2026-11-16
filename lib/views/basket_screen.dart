import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/cart_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() {
    return _BasketScreenState();
  }
}

class _BasketScreenState extends State<BasketScreen> {
  final String _confirmationMessage = '';

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<CartItem> items = basket.getItems();

    final Widget content;
    if (items.isEmpty) {
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          children: [
            const Text('Empty basket placeholder'),
            Text(_confirmationMessage),
          ],
        );
      } else {
        content = const Text('Empty basket placeholder');
      }
    } else {
      content = const Text('Basket list placeholder');
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