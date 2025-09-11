import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';
import '../../../domain/models/movie_detail.dart';

part 'get_movie_details_command.g.dart';

@riverpod
class GetMovieDetailsCommand extends _$GetMovieDetailsCommand {
  @override
  AsyncValue<MovieDetail> build() => AsyncLoading();

  Future<void> execute(int movieId) async {
    final resultado = await ref
        .read(tmdbRepositoryProvider)
        .getMovieDetails(movieId);

    state = switch (resultado) {
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(
        'Erro ao buscar detalhes deste título',
        StackTrace.current,
      ),
    };
  }
}
