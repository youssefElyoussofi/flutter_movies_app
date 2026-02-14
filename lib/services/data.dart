import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/movie.dart';
import 'package:flutter_movies_app/model/serie.dart';
import 'package:flutter_movies_app/services/movie_service.dart';
import 'package:flutter_movies_app/services/serie_service.dart';



class Data extends ChangeNotifier
{
  Data()
  {
    fetchMovies();
    fetchSeries();
  }
    List<Movie> movies = [];
    List<Serie> series = [];

    void fetchMovies() async {
        movies = await MovieService().getPopularMovies();
        notifyListeners();
    }

    void fetchSeries() async {
      series = await SerieService().getTopSeries();
      notifyListeners();
    }
}