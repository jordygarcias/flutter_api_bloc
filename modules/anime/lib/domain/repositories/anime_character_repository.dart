import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/anime_character_entity.dart';

abstract class AnimeCharacterRepository {
  Future<Either<Failure, List<AnimeCharacterEntity>>> getCharactersForAnime({
    required int animeId,
  });
}
