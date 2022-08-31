// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeImageModel _$AnimeImageModelFromJson(Map<String, dynamic> json) =>
    AnimeImageModel(
      webp: json['webp'] == null
          ? null
          : AnimeImageItemModel.fromJson(json['webp'] as Map<String, dynamic>),
      jpg: json['jpg'] == null
          ? null
          : AnimeImageItemModel.fromJson(json['jpg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimeImageModelToJson(AnimeImageModel instance) =>
    <String, dynamic>{
      'webp': instance.webp,
      'jpg': instance.jpg,
    };

AnimeImageItemModel _$AnimeImageItemModelFromJson(Map<String, dynamic> json) =>
    AnimeImageItemModel(
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$AnimeImageItemModelToJson(
        AnimeImageItemModel instance) =>
    <String, dynamic>{
      'image_url': instance.imageUrl,
    };
