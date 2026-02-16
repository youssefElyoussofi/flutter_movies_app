import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/model/movie_details.dart';
import 'package:flutter_movies_app/model/serie.dart';
import 'package:flutter_movies_app/services/movie_service.dart';
import 'package:flutter_movies_app/services/serie_service.dart';



class Data extends ChangeNotifier
{
  Data()
  {
    fetchMoviesWide();
    fetchMovies();
    fetchSeries();
  }
    List<Movie> wideMovies = [];

    List<Movie> movies = [];
    List<Serie> series = [];

    MovieDetails? movieDetails;
  


    void fetchMoviesWide() async {
        wideMovies = await MovieService().getPlayingNowWide();
        notifyListeners();
    }
    void fetchMovies() async {
        movies = await MovieService().getPopularMovies();
        notifyListeners();
    }

    void fetchSeries() async {
      series = await SerieService().getTopSeries();
      notifyListeners();
    }

    int? currentId;

    void getMovieDetails(int id, String img) async{
      
        if (id == currentId) {
          return;
        }
        currentId = id;
        movieDetails = null;
        
        movieDetails = await MovieService().getMovieDetails(id);
        notifyListeners();

    }
}