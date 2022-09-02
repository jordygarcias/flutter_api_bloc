import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../../models/anime_character_model.dart';

class AnimeCharacterRemoteDataSource {
  final Dio client;

  AnimeCharacterRemoteDataSource({
    required this.client,
  });

  Future<Either<Failure, List<AnimeCharacterModel>>> getCharactersForAnime({
    required int animeId,
  }) async {
    try {
      final response = await client.get('anime/$animeId/characters');
      if (response.statusCode == 200) {
        final characters = response.data['data']
            .map((item) => AnimeCharacterModel.fromJson(item['character']));
        return Right(List<AnimeCharacterModel>.from(characters));
      }
      return Left(ApiFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
