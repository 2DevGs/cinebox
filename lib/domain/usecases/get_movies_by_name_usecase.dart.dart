import 'package:cinebox/domain/extensions/mark_favorite_extensions.dart';

import '../../core/result/result.dart';
import '../../data/repositories/movies/movies_repository.dart';
import '../../data/repositories/tmdb/tmdb_repository.dart';
import '../models/favorite_movie.dart';
import '../models/movie.dart';

class GetMoviesByNameUsecase {
  final TmdbRepository _tmdbRepository;
  final MoviesRepository _moviesRepository;

  GetMoviesByNameUsecase({
    required TmdbRepository tmdbRepository,
    required MoviesRepository moviesRepository,
  }) : _tmdbRepository = tmdbRepository,
       _moviesRepository = moviesRepository;

  Future<Result<List<Movie>>> execute({
    required String name,
  }) async {
    final results = await Future.wait([
      _moviesRepository.getMyFavoritesMovies(),
      _tmdbRepository.searchMovies(query: name),
    ]);

    if (results case [
      Success<List<FavoriteMovie>>(value: final favorites),
      Success<List<Movie>>(value: final movies),
    ]) {
      final favoritesIDs = favorites.map((f) => f.id).toList();
      return Success(movies.markAsFavorite(favoritesIDs));
    }
    return Failure(Exception('Erro ao buscar os títulos por nome'));
  }
}
