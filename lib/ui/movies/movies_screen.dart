import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_view_model.dart';
import 'widgets/genres_box.dart';
import 'widgets/movies_appbar.dart';
import 'widgets/movies_by_category.dart';
import 'widgets/movies_by_gender.dart';
import 'widgets/movies_by_search.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  const MoviesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      ref.read(moviesViewModelProvider.notifier).fetchMoviesByCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = ref.watch(moviesViewModelProvider);

    return CustomScrollView(
      slivers: [
        MoviesAppbar(),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 22),
            child: GenresBox(),
          ),
        ),
        SliverToBoxAdapter(
          child: switch (moviesViewModel) {
            MoviesViewEnum.byCategory => MoviesByCategory(),
            MoviesViewEnum.bySearch => MoviesBySearch(),
            MoviesViewEnum.byGenre => MoviesByGender(),
          },
        ),
      ],
    );
  }
}
