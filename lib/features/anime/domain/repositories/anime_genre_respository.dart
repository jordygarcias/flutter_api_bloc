import 'package:dartz/dartz.dart';
import '../../../../core/failures/failures.dart';
import '../entities/genre_entity.dart';

abstract class AnimeGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getAnimeGenreList();
}
