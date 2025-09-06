// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMovieResponse _$FavoriteMovieResponseFromJson(
  Map<String, dynamic> json,
) => FavoriteMovieResponse(
  moieId: (json['moie_id'] as num).toInt(),
  posterUrl: json['poster_url'] as String,
  title: json['title'] as String,
  year: (json['year'] as num).toInt(),
);

Map<String, dynamic> _$FavoriteMovieResponseToJson(
  FavoriteMovieResponse instance,
) => <String, dynamic>{
  'moie_id': instance.moieId,
  'poster_url': instance.posterUrl,
  'title': instance.title,
  'year': instance.year,
};
