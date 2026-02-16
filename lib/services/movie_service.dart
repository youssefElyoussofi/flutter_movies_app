import 'package:dio/dio.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/model/movie_details.dart';

class MovieService {
  Future<List<Movie>> getPopularMovies() async {
    List<Movie> movies = [];
    final dio = Dio();

    final response = await dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=115bf8747fa287ebef94bbaa8173555a&page=1",
    );

    final list = response.data["results"];

    for (var i = 0; i < list.length; i++) {
      movies.add(
        Movie(
          name: list[i]["title"],
          imgPath: list[i]["poster_path"],
          overview: list[i]["overview"],
          wideImgPath: list[i]["backdrop_path"], id: list[i]['id']
        ),
      );
    }
    return movies;
  }

  Future<List<Movie>> getPlayingNowWide() async {
    List<Movie> movies = [];

    final dio = Dio();

    final rp = await dio.get(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=115bf8747fa287ebef94bbaa8173555a",
    );

    final List<dynamic> data = rp.data["results"];

    for (var i = 0; i < data.length; i++) {
      movies.add(Movie.fromJsonWideMovie(data[i]));
    }

    return movies;
  }


  Future<MovieDetails> getMovieDetails(int id) async
  {
    MovieDetails movie;

    final dio = Dio();

    final response = await dio.get("https://api.themoviedb.org/3/movie/$id?api_key=115bf8747fa287ebef94bbaa8173555a&append_to_response=credits");

    final data = response.data;
    final List<dynamic> genres = data["genres"];
    final List<String> cast = [];
    for (var i = 0; i < genres.length; i++) {
      cast.add(genres[i]["name"]);
    }
    
    
    
    movie = MovieDetails(data["overview"], cast, data["release_date"], data["poster_path"], data["backdrop_path"]);



    return movie;
  }
}
