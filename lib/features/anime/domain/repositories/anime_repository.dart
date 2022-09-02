import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';
import '../entities/anime_entity.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeEntity>>> getAnimeTopList();
  Future<Either<Failure, List<AnimeEntity>>> getAnimeByGenre(int genreId);
}
