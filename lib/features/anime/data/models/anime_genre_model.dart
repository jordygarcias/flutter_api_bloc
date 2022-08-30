import 'package:json_annotation/json_annotation.dart';

part 'anime_genre_model.g.dart';

@JsonSerializable()
class AnimeGenreModel {
  AnimeGenreModel({this.id, this.name});

  @JsonKey(name: 'mal_id')
  final int? id;
  final String? name;

  factory AnimeGenreModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeGenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeGenreModelToJson(this);
}
