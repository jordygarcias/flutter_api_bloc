import 'package:json_annotation/json_annotation.dart';

import 'anime_genre_model.dart';
import 'anime_image_model.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel {
  @JsonKey(name: 'mal_id')
  final int? id;
  @JsonKey(name: 'title')
  final String? name;
  @JsonKey(name: 'images')
  final AnimeImageModel? images;
  final String? synopsis;
  final String? rating;
  final double? score;
  final List<AnimeGenreModel>? genres;

  AnimeModel(
      {this.id,
      this.name,
      this.images,
      this.synopsis,
      this.rating,
      this.score,
      this.genres});

  factory AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);

  @override
  String toString() {
    return '''
      [id: $id, title $name, images=$images, ...]
    ''';
  }
}

/**
 *
 *
  final int id;
  final String name;
  final String imageUrl;
  final String synopsis;
  final String rating;
  final double score;
  final List<String> genres;
 */
