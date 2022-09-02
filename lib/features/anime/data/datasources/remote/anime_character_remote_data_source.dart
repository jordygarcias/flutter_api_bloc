import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/data/models/anime_character_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
