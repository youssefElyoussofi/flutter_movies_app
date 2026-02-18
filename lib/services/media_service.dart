import 'package:dio/dio.dart';
import 'package:flutter_movies_app/model/enums.dart';
import 'package:flutter_movies_app/model/media.dart';
import 'package:flutter_movies_app/model/media_details.dart';

class MediaService {
  Future<List<Media>> getMediaList(
    MediaType mediaType,
    ListType listType,
  ) async {
    final List<Media> mediaList = [];

    
    final dio = Dio();
    final Response rp = await dio.get(
      "https://api.themoviedb.org/3/${mediaType.type}/${listType.type}?api_key=115bf8747fa287ebef94bbaa8173555a&page=1",
    );

    final List<dynamic> dataList = rp.data["results"];

    

    

    for (int i = 0; i < dataList.length; i++) {

      mediaList.add(Media.fromJson(dataList[i],mediaType));
     
    }
    
    return mediaList;
  }

  Future<MediaDetails> getMediaDetails(MediaType mediaType, int id) async {
    late dynamic media;
  
    final dio = Dio();

    final Response rp = await dio.get(
      "https://api.themoviedb.org/3/${mediaType.type}/$id?api_key=115bf8747fa287ebef94bbaa8173555a&append_to_response=credits",
    );

    final Map<String, dynamic> data = rp.data;
    if (mediaType == MediaType.movie) {
      List<dynamic> datalist = data["genres"];
      final List<String> genres = [];
      for (int i = 0; i < datalist.length; i++) {
        genres.add(datalist[i]["name"]!);
      }

      datalist = data["credits"]["cast"];
      final List<Actor> cast = [];
      for (int i = 0; i < datalist.length; i++) {
        cast.add(
          Actor(
            name: datalist[i]["name"],
            imgPath: datalist[i]["profile_path"] ?? "",
            character: datalist[i]["character"],
          ),
        );
      }

      media = MediaDetails(
        time: data["runtime"],
        actors: cast,
        overview: data["overview"],
        genres: genres,
        releaseDate: data["release_date"],
        postImgPath: data["poster_path"],
        vote: data["vote_average"],
      );
    }
    // --------- warning---------- you need to fix this for different parsing data of tv details not like movie
    else {
      media = MediaDetails(time: 0, actors: [], overview: "", genres: [], releaseDate: "", postImgPath: "", vote: 0);
    }

    return media;
  }
}
