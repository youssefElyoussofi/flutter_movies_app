

class Movie
{
    final String overview;
    final String name;
    final String imgPath;

    late String img = "https://image.tmdb.org/t/p/w500$imgPath";
    
    Movie({required this.name,required this.imgPath,required this.overview});
}