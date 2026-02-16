import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/viewmodel/view_media_wide.dart';

class WideList extends StatelessWidget {
  final List<Movie> movies;
  final String title;
  const WideList({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
   
    return SizedBox(
      height: 220,
      child: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 5),
                child: Text(title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return ViewMediaWide(movie: movies[index]);
                    },
                  ),
              ),
            ],
          ),
    );
  }
}
