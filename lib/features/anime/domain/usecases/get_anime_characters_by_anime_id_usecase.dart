import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_character_entity.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_character_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimeCharactersByAnimeIdUseCase {
  final AnimeCharacterRepository repository;

  GetAnimeCharactersByAnimeIdUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<AnimeCharacterEntity>>> call(int animeId) =>
      repository.getCharactersForAnime(animeId: animeId);
}
