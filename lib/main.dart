import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/enums.dart';
import 'package:flutter_movies_app/services/data.dart';
import 'package:flutter_movies_app/view/media_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) {
      
      return Data();
    }
    
    , child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const Dashboard());
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
   
   final Data data = context.watch<Data>();
    
    return Scaffold(
      appBar: AppBar(title: Text("CinemaFlow"),),
      body: ListView(
        children: [
        MediaList(data: data, title: 'Top Movies', type: MediaType.movie,),
        MediaList(data: data, title: 'Top Series', type: MediaType.serie,),


        ]
      )
    );
  }
}
