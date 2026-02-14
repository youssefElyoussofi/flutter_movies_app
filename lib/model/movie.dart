

class Movie
{
    final String overview;
    final String name;
    final String _imgPath;

    String get img => "https://image.tmdb.org/t/p/w500$_imgPath";
    
    Movie({required this.name,required String imgPath,required this.overview}):_imgPath = imgPath;
}