import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../../models/anime_model.dart';

class AnimeRemoteDataSource {
  final Dio client;

  AnimeRemoteDataSource({required this.client});

  Future<Either<Failure, List<AnimeModel>>> getAnimeTopList() async {
    try {
      final response = await client.get('top/anime');
      if (response.statusCode == 200) {
        final animeList =
            response.data['data'].map((item) => AnimeModel.fromJson(item));
        return Right(List<AnimeModel>.from(animeList));
      }
      return Left(ApiFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  Future<Either<Failure, List<AnimeModel>>> getAnimeByGenre(int genreId) async {
    try {
      final response = await client.get('anime?genres=$genreId');
      if (response.statusCode == 200) {
        final animeList =
            response.data['data'].map((item) => AnimeModel.fromJson(item));
        return Right(List<AnimeModel>.from(animeList));
      }
      return Left(ApiFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
