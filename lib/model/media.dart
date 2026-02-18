import 'package:flutter_movies_app/model/enums.dart';

class Media {
  final MediaType mediaType;
  final int id;
  final String name;
  final String _imgPath;

  String get img => "https://image.tmdb.org/t/p/w500$_imgPath";

  Media({
    required MediaType type,
    required this.name,
    required String imgPath,
    required this.id,
  }) : _imgPath = imgPath,
       mediaType = type;

  factory Media.fromJson(dynamic json, MediaType type) {
    return Media(
      type: type,
      name: json["title"] ?? json["name"],
      imgPath: json["poster_path"],
      id: json["id"],
    );
  }
}
