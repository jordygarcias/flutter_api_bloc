import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeCharacterRepository {
  Future<Either<Failure, List<AnimeCharacterEntity>>> getCharactersForAnime({
    required int animeId,
  });
}
