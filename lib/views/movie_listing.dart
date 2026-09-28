import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MovieListingView extends StatefulWidget {
  const MovieListingView({super.key});

  @override
  State<MovieListingView> createState() => _MovieListingViewState();
}

class _MovieListingViewState extends State<MovieListingView> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketamount = 1;
  String _feedback = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Listing'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exercise 1: Film Info Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dracula',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('1931 • 1h 25m • Rated PG'),
                  SizedBox(height: 8),
                  Text(
                    'The ancient vampire Count Dracula arrives in England and begins to prey upon the innocent Mina Harker and her friends.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}