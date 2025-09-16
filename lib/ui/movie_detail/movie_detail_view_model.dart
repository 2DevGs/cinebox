import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/get_movie_details_command.dart';

part 'movie_detail_view_model.g.dart';

class MovieDetailViewModel {
  final GetMovieDetailsCommand _getMovieDetailsCommand;

  MovieDetailViewModel({
    required GetMovieDetailsCommand getMovieDetailsCommand,
  }) : _getMovieDetailsCommand = getMovieDetailsCommand;

  Future<void> fetchMovieDetails(int movieId) async =>
      await _getMovieDetailsCommand.execute(movieId);
}

@riverpod
MovieDetailViewModel movieDetailViewModel(Ref ref) {
  return MovieDetailViewModel(
    getMovieDetailsCommand: ref.read(getMovieDetailsCommandProvider.notifier),
  );
}
