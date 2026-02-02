import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/services/movie_service.dart';
import 'package:flutter_movies_app/view/movie_details.dart';
import 'package:flutter_movies_app/view/top_movies.dart';

void main()
{
   runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      
      home:  Scaffold(
         appBar: AppBar(title: const Center(child: Text("Movies")),),
         body: const SafeArea(child: Dashboard()),),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

   late Widget view;
   late Future<List<Movie>> movies;
   bool isDetails = false;
   late int selectedIndex = 0;

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
          
         return Column(
           children: [
               TextButton(onPressed: () {
                 isDetails = false;
                 setState(() {
                   
                 });
               }, child: Text("back")),
               Expanded(child: 
               isDetails?MovieDetails(movie: tmpMovies[selectedIndex],):
               TopMovies(moviesList: tmpMovies, press: (index) {
                 selectedIndex = index;
                 isDetails = true;
                 setState(() {
                   
                 });
               },))
           ],
         );
      }
      return const Center(child: Text("No Data Found"),);
    },);
  }
}