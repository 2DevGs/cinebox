import '../../../core/result/result.dart';
import '../../../domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {

  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();

  Future<Result<Unit>> deleteFavoriteMovie(int movideId);

  Future<Result<Unit>> saveFavoriteMovie(FavoriteMovie favoriteMovie);
}