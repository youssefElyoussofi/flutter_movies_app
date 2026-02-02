import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/viewmodel/view_movie.dart';

class TopMovies extends StatelessWidget {
  final List<Movie> moviesList;
  final Function(int index) press;

  const TopMovies({super.key, required this.moviesList, required this.press});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6
      ),
      itemCount: moviesList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            press(index);
          },
          child: ViewMovie(
            name: moviesList[index].name,
            image: moviesList[index].imgPath,
          ),
        );
      },
    );
  }
}
