import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';

class OrderScreen extends StatefulWidget {
  final Movies movies;
  final int maxQuantity;

  const OrderScreen({
    super.key, 
    required this.movies,
    this.maxQuantity = 10});

  @override
  //State<OrderScreen> createState() => _OrderScreenState();
  State<OrderScreen> createState(){
    return _OrderScreenState();
  }
}

class _OrderScreenState extends State<OrderScreen> {
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('booking: ${widget.movies.name}'),
      ),
  body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.movies.name} (${widget.movies.ageRating})',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            Image.asset(
              widget.movies.imagePath,
              width: 150,
              height: 220,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            Text(
              widget.movies.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: Text(
                    'Tickets (${widget.movies.formattedPrice} each)',
                  ),
                ),
                SizedBox(
                  width: 110,
                  child: DropdownButtonFormField<int>(
                    value: _quantity,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(
                      widget.maxQuantity + 1,
                      (quantity) => DropdownMenuItem(
                        value: quantity,
                        child: Text('$quantity'),
                      ),
                    ),
                    onChanged: (quantity) {
                      if (quantity != null) {
                        setState(() {
                          _quantity = quantity;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _quantity == 0
                  ? null
                  : () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Added $_quantity ticket(s) for ${widget.movies.name}',
                          ),
                        ),
                      );
                    },
              child: const Text('Add to order'),
            ),
          ],
        ),
      ),
    ),
  ),
),
    );
  }
}