import 'package:flutter/material.dart';
import 'package:flutter_movies_app/services/data.dart';
import 'package:flutter_movies_app/view/components/dashboar_search_widget.dart';
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
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.deepPurpleAccent,fontSize: 25,fontWeight: FontWeight.bold),
        centerTitle: true,
        title: Text("CinemaFlow"),),
      body: ListView(
        children: [
          DashboarSearchWidget(),
       MoviesList(title: 'Popular Movies', mediaList: data.popularMovies,),

       MoviesList(title: 'Top Movies', mediaList: data.topRatedMovies,),
       MoviesList(title: 'Popular Series', mediaList: data.popularSeries,),

       

       MoviesList(title: 'Top Series', mediaList: data.topRatedseries,),



        ]
      )
    );
  }
}
