
import 'package:flutter/material.dart';

import 'package:flutter_movies_app/model/media.dart';


import 'package:flutter_movies_app/view/expand_media_list.dart';

import 'package:flutter_movies_app/viewmodel/view_media.dart';

class MoviesList extends StatelessWidget {
  final List<Media> mediaList;
  
  final String title;

  const MoviesList({
    super.key,
  
    required this.title, required this.mediaList, 
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
                      return ExpandMediaList(mediaList: mediaList, title: title,);
                    },));
                  },
                  child: Text("See All"),
                ),
              ],
            ),
          ),

          mediaList.isEmpty
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()),
                )
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mediaList.length,

                    itemBuilder: (context, index) {
                      return 
                      ViewMedia(media: mediaList[index],);

                    },
                  ),
                ),
        ],
      ),
    );
  }
}
