import 'package:anime/domain/entities/genre_entity.dart';
import 'package:anime/domain/repositories/anime_genre_respository.dart';
import 'package:anime/domain/usecases/get_anime_genre_list_usecase.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_anime_genre_list_usecase_test.mocks.dart';

@GenerateMocks([AnimeGenreRepository])
void main() {
  late GetAnimeGenreListUseCase sut;
  late AnimeGenreRepository repository;

  setUp(() {
    repository = MockAnimeGenreRepository();
    sut = GetAnimeGenreListUseCase(repository: repository);
  });

  group('call', () {
    test('call getAnimeGenreList repository method', () async {
      final Either<Failure, List<GenreEntity>> repoResponse = right([]);
      when(repository.getAnimeGenreList())
          .thenAnswer((_) async => repoResponse);

      final result = await sut();

      verify(repository.getAnimeGenreList()).called(1);
      expect(result, repoResponse);
    });
  });
}
