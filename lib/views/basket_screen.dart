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

  @override
  Widget build(BuildContext context) {
    final BasketRepository basket = BasketRepository.instance;
    final List<CartItem> items = basket.getItems();

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('My Basket'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              items.isEmpty
                  ? 'Your basket is empty'
                  : 'Basket placeholder: ${items.length} item(s)',
            ),
            if (_confirmationMessage.isNotEmpty) Text(_confirmationMessage),
          ],
        ),
      ),
    );
  }
}