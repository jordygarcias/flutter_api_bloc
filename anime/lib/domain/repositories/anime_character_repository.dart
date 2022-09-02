import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../entities/anime_character_entity.dart';

abstract class AnimeCharacterRepository {
  Future<Either<Failure, List<AnimeCharacterEntity>>> getCharactersForAnime({
    required int animeId,
  });
}
