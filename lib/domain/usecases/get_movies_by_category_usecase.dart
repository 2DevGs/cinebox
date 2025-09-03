
import '../../core/result/result.dart';
import '../../data/repositories/tmdb/tmdb_repository.dart';
import '../models/movie.dart';
import '../models/movies_by_category.dart';

class GetMoviesByCategoryUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<MoviesByCategory>> execute() async {
    final results = await Future.wait([
      _tmdbRepository.getPopularMovies(),
      _tmdbRepository.getTopRatedMovies(),
      _tmdbRepository.getNowPlayingMovies(),
      _tmdbRepository.getUpComingMovies(),
    ]);

    if (results case [
      Success<List<Movie>>(value: final popular),
      Success<List<Movie>>(value: final topRated),
      Success<List<Movie>>(value: final nowPlaying),
      Success<List<Movie>>(value: final upComing),
    ]) {
      return Success(
        MoviesByCategory(
          popular: popular,
          topRated: topRated,
          nowPlaying: nowPlaying,
          upComing: upComing,
        ),
      );
    }
    return Failure(Exception('Erro ao buscar categorias de títulos'));
  }
}
