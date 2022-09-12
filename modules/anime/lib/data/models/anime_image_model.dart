import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_image_model.g.dart';

@JsonSerializable()
class AnimeImageModel extends Equatable {
  final AnimeImageItemModel? webp;
  final AnimeImageItemModel? jpg;

  const AnimeImageModel({this.webp, this.jpg});

  factory AnimeImageModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeImageModelToJson(this);

  @override
  List<Object?> get props => [webp, jpg];
}

@JsonSerializable()
class AnimeImageItemModel extends Equatable {
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  const AnimeImageItemModel({this.imageUrl});

  factory AnimeImageItemModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeImageItemModelToJson(this);

  @override
  List<Object?> get props => [imageUrl];
}
