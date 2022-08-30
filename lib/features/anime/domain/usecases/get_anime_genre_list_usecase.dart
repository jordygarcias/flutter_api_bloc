import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_genre_respository.dart';
import 'package:dartz/dartz.dart';
import '../entities/genre_entity.dart';

class GetAnimeGenreListUseCase {
  final AnimeGenreRepository repository;

  GetAnimeGenreListUseCase({required this.repository});

  Future<Either<Failure, List<GenreEntity>>> call() =>
      repository.getAnimeGenreList();
}
