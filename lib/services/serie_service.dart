

import 'package:dio/dio.dart';
import 'package:flutter_movies_app/model/serie.dart';

class SerieService {


  Future<List<Serie>> getTopSeries() async
  {
      List<Serie> seriesList = [];

    final dio = Dio();
      Response response = await dio.get("https://api.themoviedb.org/3/tv/top_rated?api_key=115bf8747fa287ebef94bbaa8173555a");

      final List list = response.data["results"];
      for (int i = 0; i < list.length; i++) {
        seriesList.add(Serie(name: list[i]["name"], imgPath: list[i]["poster_path"],overview: list[i]["overview"]));
      }
      return seriesList;
  }
}