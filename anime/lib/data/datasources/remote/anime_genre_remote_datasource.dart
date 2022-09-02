import 'package:core/core.dart';
import 'package:core/failures/failures.dart';

import '../../models/anime_genre_model.dart';

class AnimeGenreRemoteDataSource {
  final Dio client;

  AnimeGenreRemoteDataSource({required this.client});

  Future<Either<Failure, List<AnimeGenreModel>>> getAnimeGenreList() async {
    try {
      final response = await client.get('genres/anime');
      if (response.statusCode == 200) {
        final genres =
            response.data['data'].map((item) => AnimeGenreModel.fromJson(item));
        return Right(List<AnimeGenreModel>.from(genres));
      }

      return Left(ApiFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
