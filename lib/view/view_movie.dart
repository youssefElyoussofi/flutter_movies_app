
import 'package:flutter/material.dart';

class ViewMovie extends StatelessWidget {
  final String image;
  final String name;

  const ViewMovie({super.key, required this.name,required this.image});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
              color:Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            height: 350,
            width: 220,
            decoration: BoxDecoration(
              color:Colors.grey,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://image.tmdb.org/t/p/w500$image"))),),
        Text(name,style: TextStyle(fontSize: 20,color: Colors.black),)
        ],
      ),
    );
  }
}