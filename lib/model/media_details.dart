


class Actor {
  final String name;
  final String character;
  final String _imgPath;

  String get img => _imgPath.isEmpty ? "" : "https://image.tmdb.org/t/p/w500$_imgPath";

  Actor({required this.name, required String imgPath, required this.character}) : _imgPath = imgPath;
}

class MediaDetails {

  final double vote;
  final int _runTime;
  final String overview;
  final List<String> genres;
  final List<Actor> actors;
  final String releaseDate;
  final String _posteImgPath;

  String get posteImg => "https://image.tmdb.org/t/p/w500$_posteImgPath";
  
  String time(){
    final int hour = _runTime ~/ 60;
    final int min = _runTime % 60;

    return "$hour h $min m";
  }

  MediaDetails({
    required int time,
    required this.actors,
    required this.overview,
    required this.genres,
    required this.releaseDate,
    required String postImgPath,
     required this.vote,
  }) : _posteImgPath = postImgPath,
       _runTime = time;

  
}
