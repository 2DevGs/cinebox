import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/search_movies_by_name_command.dart';
import 'movies_box.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final moviesResult = ref.watch(searchMoviesByNameCommandProvider);

    return moviesResult.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Erro ao buscar títulos, por favor tente novamente!'),
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