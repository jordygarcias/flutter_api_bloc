import 'package:dartz/dartz.dart';

import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';

import 'package:api_call_exercise/core/failures/failures.dart';

import '../../domain/repositories/anime_genre_respository.dart';
import '../../data/models/anime_genre_model.dart';
import '../datasources/remote/anime_genre_remote_datasource.dart';

class AnimeGenreRepositoryImpl implements AnimeGenreRepository {
  final AnimeGenreRemoteDataSource dataSource;

  AnimeGenreRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<GenreEntity>>> getAnimeGenreList() async {
    final response = await dataSource.getAnimeGenreList();

    return response.map((List<AnimeGenreModel> genres) {
      final List<AnimeGenreModel> cleaned =
          genres.where((genre) => genre.id != null).toList();
      return cleaned
          .map((genre) =>
              GenreEntity(id: genre.id.toString(), name: genre.name ?? ''))
          .toList();
    });
  }
}
