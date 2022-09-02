import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/data/models/anime_model.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/anime_entity.dart';
import '../../domain/entities/genre_entity.dart';
import '../datasources/remote/anime_remote_datasource.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource datasource;

  AnimeRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<AnimeEntity>>> getAnimeTopList() async {
    final response = await datasource.getAnimeTopList();
    print(response);

    return response.map((List<AnimeModel> animes) {
      final List<AnimeModel> cleaned =
          animes.where((anime) => anime.id != null).toList();
      return cleaned.map(_toAnimeEntity).toList();
    });
  }

  @override
  Future<Either<Failure, List<AnimeEntity>>> getAnimeByGenre(
      int genreId) async {
    final response = await datasource.getAnimeByGenre(genreId);
    return response.map((List<AnimeModel> anime) {
      final List<AnimeModel> cleaned =
          anime.where((anime) => anime.id != null).toList();
      return cleaned.map(_toAnimeEntity).toList();
    });
  }

  AnimeEntity _toAnimeEntity(AnimeModel model) => AnimeEntity(
        id: model.id.toString(),
        name: model.name ?? '',
        imageUrl: model.images?.jpg?.imageUrl ?? '',
        synopsis: model.synopsis ?? '',
        rating: model.rating ?? '',
        score: model.score ?? 0,
        genres: model.genres
                ?.map((genre) => GenreEntity(
                    id: genre.id.toString(), name: genre.name ?? ''))
                .toList() ??
            [],
      );
}
