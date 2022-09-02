import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_entity.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

class GetAnimeByGenreUseCase {
  final AnimeRepository repository;

  GetAnimeByGenreUseCase({required this.repository});

  Future<Either<Failure, List<AnimeEntity>>> call(int? genreId) {
    if (genreId != null) {
      return repository.getAnimeByGenre(genreId);
    } else {
      return repository.getAnimeTopList();
    }
  }
}
