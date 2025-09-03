import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/movies_by_category.dart';
import '../../../domain/usecases/usecases_provider.dart';

part 'get_movies_by_category_command.g.dart';

@riverpod
class GetMoviesByCategoryCommand extends _$GetMoviesByCategoryCommand {
  @override
  AsyncValue<MoviesByCategory?> build() {
    return const AsyncData(null);
  }

  Future<void> execute() async {
    state = AsyncLoading();
    final getMoviesByCategoryUC = ref.read(getMoviesByCategoryUsecaseProvider);
    final result = await getMoviesByCategoryUC.execute();

    state = switch (result) {
      Success(value: final moviesByCategory) => AsyncData(moviesByCategory),
      Failure() => AsyncError(
        'Erro ao buscar títulos por categoria',
        StackTrace.current,
      ),
    };
  }
}
