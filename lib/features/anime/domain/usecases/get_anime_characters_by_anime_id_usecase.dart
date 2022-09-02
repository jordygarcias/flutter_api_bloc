import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_character_entity.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_character_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimeCharactersByAnimeIdUseCase {
  final AnimeCharacterRepository repository;

  GetAnimeCharactersByAnimeIdUseCase({
    required this.repository,
  });

  Future<Either<Failure, List<AnimeCharacterEntity>>> call({
    required String animeId,
  }) async {
    final intAnimeId = int.tryParse(animeId);
    if (intAnimeId == null) {
      return Left(UnexpectedFailure());
    }
    return repository.getCharactersForAnime(animeId: intAnimeId);
  }
}
