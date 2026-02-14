class Serie 
{
      final String name;
      final String _imgPath;
      final String overview;

      String get img => "https://image.tmdb.org/t/p/w500$_imgPath";

      Serie({required this.name,required String imgPath,required this.overview}):_imgPath = imgPath;
}