import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/repositories/repositories_providers.dart';
import 'get_movies_by_category_usecase.dart';

part 'usecases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.read(tmdbRepositoryProvider),
  );
}
