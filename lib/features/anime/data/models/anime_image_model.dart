import 'package:json_annotation/json_annotation.dart';

part 'anime_image_model.g.dart';

@JsonSerializable()
class AnimeImageModel {
  final AnimeImageItemModel? webp;
  final AnimeImageItemModel? jpg;

  AnimeImageModel({this.webp, this.jpg});

  factory AnimeImageModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeImageModelToJson(this);

  @override
  String toString() {
    return '[webp: $webp, jpg: $jpg]';
  }
}

@JsonSerializable()
class AnimeImageItemModel {
  @JsonKey(name: 'image_url')
  final String? imageUrl;

  AnimeImageItemModel({this.imageUrl});

  factory AnimeImageItemModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeImageItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeImageItemModelToJson(this);

  @override
  String toString() {
    return '[imageUrl: $imageUrl]';
  }
}
