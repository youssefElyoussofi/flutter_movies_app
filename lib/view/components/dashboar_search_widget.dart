import 'package:flutter/material.dart';

class DashboarSearchWidget extends StatelessWidget {
  const DashboarSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(81, 180, 136, 255),
          borderRadius: BorderRadius.circular(30),
          // border: Border.all(width: 2)
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            Text("Search movies...")
          ],
        ),
    );
  }
}