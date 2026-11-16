import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movies movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Text(movie.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                movie.imagePath,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movie.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Age rating: ${movie.ageRating}'),
            Text('Length: ${movie.length} mins'),
            const SizedBox(height: 16),
            Text(movie.description),
            const SizedBox(height: 16),
            Text(
              'Ticket price: ${movie.formattedPrice}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              label: 'Add to basket',
              onPressed: () {
                BasketRepository.instance.addItem(movie);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${movie.name} added to basket')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}