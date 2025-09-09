import '../models/movie.dart';

extension MarkFavoriteExtensions on List<Movie> {
  List<Movie> markAsFavorite(List<int> myFavorites) {
    return map((m) {
      if (myFavorites.contains(m.id)) {
        return m.copyWith(isFavorite: true);
      }
      return m;
    }).toList();
  }
}
