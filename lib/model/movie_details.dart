

class MovieDetails {

  final String overview;
  final List<String> genres;
  final String releaseDate;
  final String _posteImgPath;
  final String _wideImgPath;
  final String _baseUrl = "https://image.tmdb.org/t/p/w500";

  String get posteImg =>  "$_baseUrl$_posteImgPath";
  String get wideImg =>  "$_baseUrl$_wideImgPath";

  MovieDetails(this.overview, this.genres, this.releaseDate, this._posteImgPath, this._wideImgPath);

    
}