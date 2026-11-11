import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

class MenuScreen extends StatelessWidget{
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context){
    final MoviesRepository repository = MoviesRepository();
    final List<Movies>movie = repository.getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Showing'),
      ),
      body: ListView.builder(
        itemCount: movie.length,
        itemBuilder: (context, index){
          return MovieCard(movies: movie[index]);
        }
      )
    );
  }
}

