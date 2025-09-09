import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/repositories_providers.dart';
import 'get_movies_by_category_usecase.dart';
import 'get_movies_by_genre_usecase.dart';
import 'get_movies_by_name_usecase.dart.dart';

part 'usecases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
    moviesRepository: ref.read(moviesRepositoryProvider),
  );
}

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) =>
    GetMoviesByGenreUsecase(
      tmdbRepository: ref.read(tmdbRepositoryProvider),
      moviesRepository: ref.read(moviesRepositoryProvider),
    );

@riverpod
GetMoviesByNameUsecase getMoviesByNameUsecase(Ref ref) =>
    GetMoviesByNameUsecase(
      tmdbRepository: ref.read(tmdbRepositoryProvider),
      moviesRepository: ref.read(moviesRepositoryProvider),
    );
