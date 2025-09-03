import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

import '../../core/result/result.dart';
import '../models/movie.dart';

class GetMoviesByGenreUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required int genreId,}) async {
    final moviesByGenreResult = await _tmdbRepository.getMoviesByGenres(genreId: genreId);
    return moviesByGenreResult;
  }

}
