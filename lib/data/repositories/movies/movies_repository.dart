import '../../../core/result/result.dart';
import '../../../domain/models/favorite_movie.dart';

abstract interface class MoviesRepository {

  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies();

}