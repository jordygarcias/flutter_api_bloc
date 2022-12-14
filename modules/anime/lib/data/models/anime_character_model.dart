import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'anime_image_model.dart';

part 'anime_character_model.g.dart';

@JsonSerializable()
class AnimeCharacterModel extends Equatable {
  @JsonKey(name: 'mal_id')
  final int? id;
  final String? name;
  final AnimeImageModel? images;

  const AnimeCharacterModel({this.id, this.name, this.images});

  factory AnimeCharacterModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeCharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeCharacterModelToJson(this);

  @override
  List<Object?> get props => [id, name, images];
}
