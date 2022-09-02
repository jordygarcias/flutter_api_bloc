import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../entities/anime_entity.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeEntity>>> getAnimeTopList();
  Future<Either<Failure, List<AnimeEntity>>> getAnimeByGenre(int genreId);
}
