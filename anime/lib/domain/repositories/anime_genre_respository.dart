import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../entities/genre_entity.dart';

abstract class AnimeGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getAnimeGenreList();
}
