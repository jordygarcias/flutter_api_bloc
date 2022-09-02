import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../entities/anime_entity.dart';
import '../repositories/anime_repository.dart';

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
