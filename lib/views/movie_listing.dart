import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieListing extends StatefulWidget {
  final Movies movie;

  const MovieListing({super.key, required this.movie});

  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int _tickets = 0;

  void _addToOrder() {
    if (_tickets == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Choose how many tickets first')),
      );
      return;
    }
    BasketRepository.instance.addItem(widget.movie, quantity: _tickets);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$_tickets ticket(s) for ${widget.movie.name} added'),
      ),
    );
    setState(() {
      _tickets = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Movies movie = widget.movie;

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Southsea Cinema'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${movie.name.toUpperCase()} (${movie.ageRating})',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Image.asset(
              movie.imagePath,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text('Southsea Cinema Room'),
            Text('Length: ${movie.length} mins'),
            const SizedBox(height: 16),
            Text(movie.description),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tickets (${movie.formattedPrice} each)'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white54),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButton<int>(
                    value: _tickets,
                    underline: const SizedBox(),
                    items: [
                      for (int i = 0; i <= 10; i++)
                        DropdownMenuItem<int>(value: i, child: Text('$i')),
                    ],
                    onChanged: (int? value) {
                      setState(() {
                        _tickets = value ?? 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            PrimaryButton(label: 'Add to order', onPressed: _addToOrder),
          ],
        ),
      ),
    );
  }
}