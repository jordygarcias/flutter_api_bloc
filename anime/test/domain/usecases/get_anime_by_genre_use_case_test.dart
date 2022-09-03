import 'package:anime/domain/entities/anime_entity.dart';
import 'package:anime/domain/repositories/anime_repository.dart';
import 'package:anime/domain/usecases/get_anime_by_genre_use_case.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_anime_by_genre_use_case_test.mocks.dart';

@GenerateMocks([AnimeRepository])
void main() {
  late GetAnimeByGenreUseCase sut;
  late AnimeRepository repository;

  setUp(() {
    repository = MockAnimeRepository();
    sut = GetAnimeByGenreUseCase(repository: repository);
  });

  group('call', () {
    test('call AnimeTopList when no genreId is passed', () async {
      final Either<Failure, List<AnimeEntity>> repoResponse = right([]);
      when(repository.getAnimeTopList()).thenAnswer((_) async => repoResponse);

      final result = await sut(null);

      verify(repository.getAnimeTopList()).called(1);
      expect(result, repoResponse);
    });
    test('call getAnimeByGenre when genreId is passed', () async {
      const genreId = 1;
      final Either<Failure, List<AnimeEntity>> repoResponse = right([]);
      when(repository.getAnimeByGenre(genreId))
          .thenAnswer((_) async => repoResponse);

      final result = await sut(genreId);

      verify(repository.getAnimeByGenre(genreId)).called(1);
      expect(result, repoResponse);
    });
  });
}
