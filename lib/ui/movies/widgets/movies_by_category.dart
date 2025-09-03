import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/get_movies_by_category_command.dart';
import 'movies_box.dart';

class MoviesByCategory extends ConsumerWidget {
  const MoviesByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      loading: () => Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text('Erro ao buscar títulos'),
        ),
      ),
      data: (data) {
        if (data == null) {
          return Center(
            child: Text('Nenhum título encontrado'),
          );
        }
        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: Column(
            children: [
              // Titulo
              MoviesBox(
                title: 'Mais Populares',
                movies: data.popular,
              ),
              // MoviesBox(
              //   title: 'Mais Avaliados',
              //   movies: data.topRated,
              // ),
              // MoviesBox(
              //   title: 'Em Cartaz',
              //   movies: data.nowPlaying,
              // ),
              // MoviesBox(
              //   title: 'Em Breve',
              //   movies: data.upComing,
              // ),
            ],
          ),
        );
      },
    );
  }
}
