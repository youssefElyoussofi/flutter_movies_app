
import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/enums.dart';

import 'package:flutter_movies_app/services/data.dart';
import 'package:flutter_movies_app/view/expand_list.dart';
import 'package:flutter_movies_app/viewmodel/view_media.dart';

class MoviesList extends StatelessWidget {
  final Data data;
  final String title;

  const MoviesList({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 320,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ExpandList(data: data,title: title);
                    },));
                  },
                  child: Text("See All"),
                ),
              ],
            ),
          ),

          data.movies.isEmpty
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.movies.length,

                    itemBuilder: (context, index) {
                      return 
                      ViewMedia(movie: data.movies[index]);
                      // ViewMedia(
                      //   name: type == MediaType.movie
                      //       ? data.movies[index].name
                      //       : data.series[index].name,
                      //   image: type == MediaType.movie
                      //       ? data.movies[index].img
                      //       : data.series[index].img,
                      // );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
