
import 'package:flutter/material.dart';

class ViewMovie extends StatelessWidget {
  final String image;
  final String name;

  const ViewMovie({super.key, required this.name,required this.image});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          height: 500,
          width: 450,
          decoration: BoxDecoration(
            color:Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500$image"))),),
        Text(name,style: TextStyle(fontSize: 20,color: Colors.black),)
      ],
    );
  }
}