import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/favorite_movie_response.dart';
import '../../models/save_favorite_movie.dart';

part 'movies_service.g.dart';

@RestApi()
abstract class MoviesService {
  factory MoviesService(Dio dio) = _MoviesService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getMyFavoritesMovies();

  @DELETE('/favorite/{movie_id}')
  Future<void> deleteFavoriteMovie(
    @Path('movie_id') int movieId,
  );

  @POST('/favorite')
  Future<void> saveFavoriteMovie(
    @Body() SaveFavoriteMovie request,
  );
}
