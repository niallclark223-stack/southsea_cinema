import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() {
    return _MenuScreenState();
  }
}

class _MenuScreenState extends State<MenuScreen> {
  final MoviesRepository _repository = MoviesRepository();
  List<Movies> _movies = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final List<Movies> loaded = await _repository.loadMovies();
      if (!mounted) return;
      setState(() {
        _movies = loaded;
        _isLoading = false;
      });
        } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = 'Could not load films';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (_isLoading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      body = Center(child: Text(_errorMessage));
    } else {
      body = ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          return MovieCard(movies: _movies[index]);
        },
      );
    }

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text('Now Showing'),
      ),
      body: body,
    );
  }
}

