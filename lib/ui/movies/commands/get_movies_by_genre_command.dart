import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/movie.dart';
import '../../../domain/usecases/usecases_provider.dart';

part 'get_movies_by_genre_command.g.dart';

@riverpod
class GetMoviesByGenreCommand extends _$GetMoviesByGenreCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(int genreId) async {
    state = AsyncLoading();
    final genreUC = ref.read(getMoviesByGenreUsecaseProvider);
    final result = await genreUC.execute(genreId: genreId);
    state = switch (result) {
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(
        Exception('Erro ao buscar títulos por gênero, tente novamente!'),
        StackTrace.current,
      ),
    };
  }
}
