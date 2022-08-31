// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      id: json['mal_id'] as int?,
      name: json['title'] as String?,
      images: json['images'] == null
          ? null
          : AnimeImageModel.fromJson(json['images'] as Map<String, dynamic>),
      synopsis: json['synopsis'] as String?,
      rating: json['rating'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => AnimeGenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'title': instance.name,
      'images': instance.images,
      'synopsis': instance.synopsis,
      'rating': instance.rating,
      'score': instance.score,
      'genres': instance.genres,
    };
