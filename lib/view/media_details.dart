import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/services/data.dart';
import 'package:provider/provider.dart';

class MediaDetails extends StatelessWidget {
  final Movie movie;

  const MediaDetails({super.key, required this.movie});
  @override
  Widget build(BuildContext context) {
    final Data data = context.watch<Data>();
    data.getMovieDetails(movie.id, movie.img);
    return Scaffold(
      appBar: AppBar(title: Text(movie.name)),
      body: data.movieDetails == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(data.movieDetails!.wideImg),
                    ),
                  ),
                ),
                
                
               Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for(String item in data.movieDetails!.genres)
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(120, 180, 136, 255),
                        borderRadius: BorderRadius.circular(15)),
                      child: Text(item)),
                ],
               ),
               Padding(
                padding: EdgeInsets.only(left: 15,top: 10),
                child: Text("overview")),
               Padding(
                padding: EdgeInsets.all(10),
                child: Text(data.movieDetails!.overview)),
                
              ],
            ),
    );
  }
}
