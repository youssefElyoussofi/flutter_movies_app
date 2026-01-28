import 'package:dio/dio.dart';
import 'package:flutter_movies_app/model/movie.dart';

class MovieService {


  Future<List<Movie>> getPopularMovies() async {
    List<Movie> movies = [];
    final dio = Dio();

    final response = await dio.get(
      "https://api.themoviedb.org/3/tv/popular?api_key=115bf8747fa287ebef94bbaa8173555a&page=1",
    );

    final list = response.data["results"];

    for (var i = 0; i < list.length; i++) 
    {
        movies.add(Movie(name: list[i]["name"], imgPath: list[i]["poster_path"]));
    }
    return movies;
  }
}
