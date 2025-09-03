import 'movie.dart';

class MoviesByCategory {

  final List<Movie> popular; 
  final List<Movie> topRated; 
  final List<Movie> nowPlaying; 
  final List<Movie> upComing; 

  MoviesByCategory({
    required this.popular,
    required this.topRated,
    required this.nowPlaying,
    required this.upComing,
  });

}
