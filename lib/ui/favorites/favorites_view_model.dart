import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/movies/movies_repository.dart';
import '../../data/repositories/repositories_providers.dart';
import 'commands/get_favorites_command.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoritesCommand _getFavoritesCommand;
  final MoviesRepository _moviesRepository;

  FavoritesViewModel({
    required GetFavoritesCommand getFavoritesCommand,
    required MoviesRepository moviesRepository,
  }) : _getFavoritesCommand = getFavoritesCommand,
       _moviesRepository = moviesRepository;

  Future<void> fetchFavorites() => _getFavoritesCommand.execute();
  Future<void> deleteFavoriteMovie(int movieId) async {
    await _moviesRepository.deleteFavoriteMovie(movieId);
    fetchFavorites();
  }
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(
    getFavoritesCommand: ref.read(getFavoritesCommandProvider.notifier),
    moviesRepository: ref.read(moviesRepositoryProvider),
  );
}
