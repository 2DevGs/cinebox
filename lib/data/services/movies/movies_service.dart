import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/favorite_movie_response.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getMyFavoritesMovies();
}