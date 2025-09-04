import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';

import '../../core/result/result.dart';
import '../models/movie.dart';

class GetMoviesByNameUsecase {
  final TmdbRepository _tmdbRepository;

  GetMoviesByNameUsecase({required TmdbRepository tmdbRepository})
    : _tmdbRepository = tmdbRepository;

  Future<Result<List<Movie>>> execute({required String name,}) async {
    final moviesByGenreResult = await _tmdbRepository.searshMovies(query: name);
    return moviesByGenreResult;
  }

}
