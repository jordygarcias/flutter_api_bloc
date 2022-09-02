import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../entities/anime_character_entity.dart';
import '../repositories/anime_character_repository.dart';

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
