enum MediaType {
  movie("movie"),serie("tv");

  final String type;

  const MediaType(String mediaType):type = mediaType;
  
  }

enum ListType {

  popular("popular"),
  topRated("top_rated");


  final String type;

  const ListType(String listType):type = listType;
}