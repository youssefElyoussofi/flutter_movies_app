class Movie {
  final int id;
  final String overview;
  final String name;
  final String _imgPath;
  final String? _wideImgPath;
  static const String _baseUrl = "https://image.tmdb.org/t/p/w500";

  String get img => "$_baseUrl$_imgPath";
  String? get wideImg => _wideImgPath == null ? null: "$_baseUrl$_wideImgPath";

  Movie({
    required this.name,
    required String imgPath,
    required this.overview,
    String? wideImgPath, required this.id,
  }) : _imgPath = imgPath,
       _wideImgPath = wideImgPath;

  factory Movie.fromJsonWideMovie(Map<String, dynamic> json) => Movie(
    id: json['id'],
    name: json['name']??json['title'],
    imgPath: json['poster_path'],
    overview: json['overview'],
    wideImgPath: json['backdrop_path'],
  );
}
