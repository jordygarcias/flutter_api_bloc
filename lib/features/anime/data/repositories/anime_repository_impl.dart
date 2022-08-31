import 'package:api_call_exercise/features/anime/data/models/anime_model.dart';
import 'package:api_call_exercise/core/failures/failures.dart';
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
      return cleaned
          .map((anime) => AnimeEntity(
                id: anime.id.toString(),
                name: anime.name ?? '',
                imageUrl: anime.images?.jpg?.imageUrl ?? '',
                synopsis: anime.synopsis ?? '',
                rating: anime.rating ?? '',
                score: anime.score ?? 0,
                genres: anime.genres
                        ?.map((genre) => GenreEntity(
                            id: genre.id.toString(), name: genre.name ?? ''))
                        .toList() ??
                    [],
              ))
          .toList();
    });
  }
}
