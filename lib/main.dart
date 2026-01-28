import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/services/movie_service.dart';
import 'package:flutter_movies_app/view/view_movie.dart';

void main()
{
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home:  Scaffold(
         body:  Conter(),),
    );
  }
}

class Conter extends StatefulWidget {
  const Conter({super.key});

  @override
  State<Conter> createState() => _ConterState();
}

class _ConterState extends State<Conter> {

   late Future<List<Movie>> movies;

   int  count = 0;

   @override
   void initState() {
    movies = MovieService().getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<List<Movie>>(
      future: movies, 
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircleAvatar(),);
        }
        if (snapshot.hasData){
         List<Movie> moviesData = snapshot.data!;
         return ListView.builder(
            itemCount: moviesData.length,
            itemBuilder: (context, index) {
            return ViewMovie(name: moviesData[index].name, image: moviesData[index].imgPath);
         },);
        }
        return const Center(child: Text("No data found"),);
      },
      );
  }
}

