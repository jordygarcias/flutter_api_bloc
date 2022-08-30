// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_genre_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeGenreModel _$AnimeGenreModelFromJson(Map<String, dynamic> json) =>
    AnimeGenreModel(
      id: json['mal_id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AnimeGenreModelToJson(AnimeGenreModel instance) =>
    <String, dynamic>{
      'mal_id': instance.id,
      'name': instance.name,
    };
