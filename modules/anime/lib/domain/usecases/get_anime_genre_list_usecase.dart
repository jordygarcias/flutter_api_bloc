import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/genre_entity.dart';
import '../repositories/anime_genre_respository.dart';

class GetAnimeGenreListUseCase {
  final AnimeGenreRepository repository;

  GetAnimeGenreListUseCase({required this.repository});

  Future<Either<Failure, List<GenreEntity>>> call() =>
      repository.getAnimeGenreList();
}
