import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/genre.dart';
import '../../../domain/models/movie.dart';
import '../../exceptions/data_exception.dart';
import '../../mappers/movie_mapper.dart';
import '../../services/tmdb/tmdb_service.dart';
import 'tmdb_repository.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService})
    : _tmdbService = tmdbService;

  @override
  Future<Result<List<Movie>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );
      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );
      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );
      return Success(MovieMapper.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log(
        'Erro ao buscar getPopularMovies',
        error: e,
        stackTrace: s,
      );
      return Failure(
        DataException(message: 'Erro ao buscar os filmes populares'),
      );
    }
  }

  @override
  Future<Result<List<Genre>>> getGenres() async {
    try {
      final data = await _tmdbService.getMoviesGenres();
      final genres = data.genres
          .map((g) => Genre(id: g.id, name: g.name))
          .toList();
      return Success(genres);
    } on DioException catch (e, s) {
      log('Erro ao buscar generos', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar generos'));
    }
  }

  @override
  Future<Result<List<Movie>>> getMoviesByGenres({required int genreId}) async {
    try {
      final data = await _tmdbService.discoverMovies(
        withGenres: genreId.toString(),
      );
      return Success(MovieMapper.mapToMovies(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar títulos por gênero', error: e, stackTrace: s);
      return Failure(
        DataException(message: 'Erro ao buscar títulos por gênero'),
      );
    }
  }
}
