import 'package:flutter/material.dart';
import 'package:flutter_movies_app/model/enums.dart';
import 'package:flutter_movies_app/model/media.dart';
import 'package:flutter_movies_app/model/media_details.dart';
import 'package:flutter_movies_app/services/media_service.dart';



class Data extends ChangeNotifier
{
  Data()
  {
    fetchPopularMovies();
    fetchPopularSeries();
    fetchTopRatedMovies();
    fetchTopRatedSeries();
  }
    List<Media> topRatedMovies = [];
    List<Media> popularMovies = [];
    List<Media> topRatedseries = [];
    List<Media> popularSeries = [];

    MediaDetails? mediaDetails;
  

    void fetchPopularMovies() async {
        popularMovies = await MediaService().getMediaList(MediaType.movie,ListType.popular);
        notifyListeners();
    }

    void fetchPopularSeries() async {
        popularSeries = await MediaService().getMediaList(MediaType.serie,ListType.popular);
        notifyListeners();
    }

    void fetchTopRatedMovies() async {
      topRatedMovies = await MediaService().getMediaList(MediaType.movie,ListType.topRated);
            notifyListeners();
    }

    void fetchTopRatedSeries() async {
      topRatedseries = await MediaService().getMediaList(MediaType.serie, ListType.topRated);
    }

    int? currentId;

    void getMovieDetails(int id, MediaType type) async{
      
        if (id == currentId) {
          return;
        }
        currentId = id;
        mediaDetails = null;
        
        mediaDetails = await MediaService().getMediaDetails(type, id);
        notifyListeners();

    }
}