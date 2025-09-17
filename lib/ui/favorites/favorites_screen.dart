import 'package:cinebox/ui/core/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/favorite_movie.dart';
import '../core/widgets/loader_messages.dart';
import 'commands/get_favorites_command.dart';
import 'favorites_view_model.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> with LoaderAndMessage {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoritesCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
      ),
      body: favoritesMovies.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Erro ao buscar títulos favoritos'),
        ),
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Text('Nenhum título cadastrado como favorito.'),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final FavoriteMovie(
                        :id,
                        :title,
                        :year,
                        posterPath: imageUrl,
                      ) = data[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: id,
                          title: title,
                          year: year,
                          imageUrl: imageUrl,
                          isFavorite: true,
                          onFavoriteTap: () async {
                            showLoader();
                            await ref
                                .read(favoritesViewModelProvider)
                                .deleteFavoriteMovie(id);
                            hideLoader();
                          },
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
