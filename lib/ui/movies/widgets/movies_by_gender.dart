import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/get_movies_by_genre_command.dart';
import 'movies_box.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchMovies = ref.watch(getMoviesByGenreCommandProvider);

    return searchMovies.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Erro ao buscar títulos'),
      ),
      data: (data) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 130,
          ),
          child: MoviesBox(
            title: 'Títulos encontrados',
            vertical: true,
            movies: data,
          ),
        );
      },
    );
  }
}
