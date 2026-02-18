import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/media.dart';
import 'package:flutter_movies_app/viewmodel/view_media.dart';

class ExpandMediaList extends StatelessWidget {

  final String title;
  final List<Media> mediaList;
  const ExpandMediaList({
    super.key, required this.title, required this.mediaList,
   

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
        mediaList.length,
        itemBuilder: (context, index) {
          return  ViewMedia(media: mediaList[index],);
        },
      ),
    );
  }
}
