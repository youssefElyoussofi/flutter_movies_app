import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(movie.img),
          ),
        ),
        
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text(movie.overview),
          )),

      ],
    );
  }
}