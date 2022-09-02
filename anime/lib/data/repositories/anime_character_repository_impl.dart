import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../../domain/entities/anime_character_entity.dart';
import '../../domain/repositories/anime_character_repository.dart';
import '../datasources/remote/anime_character_remote_data_source.dart';
import '../models/anime_character_model.dart';

class AnimeCharacterRepositoryImpl implements AnimeCharacterRepository {
  final AnimeCharacterRemoteDataSource dataSource;

  AnimeCharacterRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<AnimeCharacterEntity>>> getCharactersForAnime({
    required int animeId,
  }) async {
    final response = await dataSource.getCharactersForAnime(animeId: animeId);
    return response.map((List<AnimeCharacterModel> characters) {
      final cleaned = characters.where((model) => model.id != null).toList();
      return cleaned.map(_toAnimeCharacterEntity).toList();
    });
  }

  AnimeCharacterEntity _toAnimeCharacterEntity(
    AnimeCharacterModel animeCharacterModel,
  ) =>
      AnimeCharacterEntity(
        id: animeCharacterModel.id.toString(),
        name: animeCharacterModel.name ?? '',
        imageUrl: animeCharacterModel.images?.jpg?.imageUrl ?? '',
      );
}
