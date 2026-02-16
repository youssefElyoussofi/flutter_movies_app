import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/enums.dart';
import 'package:flutter_movies_app/services/data.dart';
import 'package:flutter_movies_app/viewmodel/view_media.dart';

class ExpandList extends StatelessWidget {

  final String title;
  final Data data;
  const ExpandList({
    super.key,
    required this.data,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 5,
          crossAxisSpacing: 0,
          childAspectRatio: 0.6,
          crossAxisCount: 2,
        ),
        itemCount: 
             data.movies.length,
        itemBuilder: (context, index) {
          return 
          ViewMedia(movie: data.movies[index]);
          // ViewMedia(
          //   name: type == MediaType.movie ? data.movies[index].name : data.series[index].name,
          //   image: type == MediaType.movie ? data.movies[index].img : data.series[index].img,
          // );
        },
      ),
    );
  }
}
