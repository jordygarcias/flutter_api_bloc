import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_genre_model.g.dart';

@JsonSerializable()
class AnimeGenreModel extends Equatable {
  const AnimeGenreModel({this.id, this.name});

  @JsonKey(name: 'mal_id')
  final int? id;
  final String? name;

  factory AnimeGenreModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeGenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeGenreModelToJson(this);

  @override
  List<Object?> get props => [id, name];
}
