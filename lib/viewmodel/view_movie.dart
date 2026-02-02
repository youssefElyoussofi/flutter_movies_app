import 'package:flutter/material.dart';

class ViewMovie extends StatelessWidget {
  final String image;
  final String name;

  const ViewMovie({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
      color: Color.fromARGB(25, 133, 26, 255),
      borderRadius: BorderRadius.circular(20),
        // border: Border.all(color: Color.fromARGB(27, 133, 26, 255),width: 1)
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 10),
              // height: 250,
              // width: 160,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("https://image.tmdb.org/t/p/w500$image"),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                name,
                // style: TextStyle(fontSize: 30, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
