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
         body:  Dashboard(),),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

   late Future<List<Movie>> movies;

   @override
  void initState() {
    movies = MovieService().getPopularMovies();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(future: movies, builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasData){
         List<Movie> tmpMovies = snapshot.data!;
         return ListView.builder(
            itemCount: tmpMovies.length,
            itemBuilder: (context, index) {
           return ViewMovie(name: tmpMovies[index].name, image: tmpMovies[index].imgPath);
         },);
      }
      return const Center(child: Text("No Data Found"),);
    },);
  }
}