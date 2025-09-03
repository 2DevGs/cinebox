
import '../../domain/models/movie.dart';
import '../models/movie_response.dart';

class MovieMapper {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => Movie(
            id: response.id,
            title: response.title,
            overview: response.overview,
            genreIds: response.genreIds ?? [],
            voteAvarage: response.voteAverage,
            posterPath: response.posterPath,
            backdropPath: response.backdropPath,
            releaseDate: response.releaseDate,
          ),
        )
        .toList();
  }
}
