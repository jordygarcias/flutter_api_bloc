import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/genre_entity.dart';

abstract class AnimeGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getAnimeGenreList();
}
