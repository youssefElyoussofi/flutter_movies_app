import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';

import 'package:flutter_movies_app/services/data.dart';
import 'package:flutter_movies_app/view/media_details.dart';
import 'package:provider/provider.dart';

class ViewMedia extends StatelessWidget {
  final Movie movie;

  const ViewMedia({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
      color: Color.fromARGB(25, 133, 26, 255),
      borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromARGB(66, 133, 26, 255),width: 1)
      ),
      child: SizedBox(
        height: 250,
        width: 150,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MediaDetails(movie: movie);
                  },));
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  // height: 250,
                  // width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.img),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    movie.name,
                    // style: TextStyle(fontSize: 30, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
