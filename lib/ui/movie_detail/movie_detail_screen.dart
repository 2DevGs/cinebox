import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/cast_box.dart';
import 'package:cinebox/ui/movie_detail/widgets/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/widgets/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24,
          children: [
            SizedBox(
              height: 278,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: ClampingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1619952571l/56817438.jpg',
                      placeholder: (context, url) => Container(
                        width: 160,
                        color: AppColors.lightGrey,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    'Titulo',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    valueLabelVisibility: false,
                    value: 3.7,
                  ),
                  Text(
                    'Animação, Comédia, Família, Fantasia',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text(
                    '2025 (USA) | 1h41',
                    style: AppTextStyles.regularSmall,
                  ),
                  Text(
                    'Descriçãoooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox(),
                  MovieTrailer(),
                  const SizedBox(
                     height: 30,
                  ),
                  RatingPanel(voteAverage: 20, voteCount: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
