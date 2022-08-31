import 'package:api_call_exercise/features/anime/domain/entities/anime_entity.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

class GetAnimeTopListUseCase {
  final AnimeRepository repository;

  GetAnimeTopListUseCase({required this.repository});

  Future<Either<Failure, List<AnimeEntity>>> call() =>
      repository.getAnimeTopList();
}
