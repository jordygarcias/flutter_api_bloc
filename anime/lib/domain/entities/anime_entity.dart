import 'package:equatable/equatable.dart';

import 'genre_entity.dart';

class AnimeEntity extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String synopsis;
  final String rating;
  final double score;
  final List<GenreEntity> genres;

  const AnimeEntity({
    required this.name,
    required this.imageUrl,
    required this.synopsis,
    required this.rating,
    required this.score,
    required this.genres,
    required this.id,
  });

  @override
  List<Object?> get props =>
      [id, name, imageUrl, synopsis, rating, score, genres];
}
