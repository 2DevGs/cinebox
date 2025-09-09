import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/favorite_movie.dart';
import '../../exceptions/data_exception.dart';
import '../../services/movies/movies_service.dart';
import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService moviesService})
    : _moviesService = moviesService;

  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovie(
              id: f.moieId,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();
      return Success(favorites);
    } on DioException catch (e, s) {
      log('Erro ao buscar os títulos favoritos', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar os títulos favoritos'),
      );
    }
  }
}
