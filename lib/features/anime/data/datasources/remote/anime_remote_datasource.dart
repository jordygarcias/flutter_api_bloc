import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/failures/failures.dart';
import '../../models/anime_model.dart';

class AnimeRemoteDataSource {
  final Dio client;

  AnimeRemoteDataSource({required this.client});

  Future<Either<Failure, List<AnimeModel>>> getAnimeTopList() async {
    try {
      final response = await client.get('top/anime');
      if (response.statusCode == 200) {
        final animeList =
            response.data['data'].map((item) {
              final map = AnimeModel.fromJson(item);
              print(map.images);
              return map;
            });
        return Right(List<AnimeModel>.from(animeList));
      }
      return Left(ApiFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
