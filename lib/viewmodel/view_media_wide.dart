import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';

class ViewMediaWide extends StatelessWidget {
  final Movie movie;
  const ViewMediaWide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: AlignmentGeometry.bottomLeft,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(

          fit: BoxFit.fill,
          image: NetworkImage(movie.wideImg!)),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        margin: EdgeInsets.all(15),
        child: Text(movie.name,style: TextStyle(fontWeight: FontWeight.bold),)),
    );
  }
}