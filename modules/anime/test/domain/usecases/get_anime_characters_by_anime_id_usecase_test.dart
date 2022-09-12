import 'package:anime/domain/entities/anime_character_entity.dart';
import 'package:anime/domain/repositories/anime_character_repository.dart';
import 'package:anime/domain/usecases/get_anime_characters_by_anime_id_usecase.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_anime_characters_by_anime_id_usecase_test.mocks.dart';

@GenerateMocks([AnimeCharacterRepository])
void main() {
  late GetAnimeCharactersByAnimeIdUseCase sut;
  late AnimeCharacterRepository repository;

  setUp(() {
    repository = MockAnimeCharacterRepository();
    sut = GetAnimeCharactersByAnimeIdUseCase(repository: repository);
  });

  group('call', () {
    test('when id cannot be parsed to int, return an UnexpectedFailure',
        () async {
      final result = await sut(animeId: 'not a number');
      expect(result.isLeft(), isTrue);
      expect(result.leftOrNull(), isA<UnexpectedFailure>());
    });
    test('call getCharactersForAnime in repository', () async {
      const animeId = 1;
      final Either<Failure, List<AnimeCharacterEntity>> repoResponse =
          right([]);
      when(repository.getCharactersForAnime(animeId: animeId))
          .thenAnswer((_) async => repoResponse);

      final result = await sut(animeId: animeId.toString());

      verify(repository.getCharactersForAnime(animeId: animeId)).called(1);
      expect(result, repoResponse);
    });
  });
}
