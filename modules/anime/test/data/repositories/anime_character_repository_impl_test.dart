import 'package:anime/data/datasources/remote/anime_character_remote_data_source.dart';
import 'package:anime/data/models/anime_character_model.dart';
import 'package:anime/data/models/anime_image_model.dart';
import 'package:anime/data/repositories/anime_character_repository_impl.dart';
import 'package:anime/domain/entities/anime_character_entity.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_character_repository_impl_test.mocks.dart';

@GenerateMocks([AnimeCharacterRemoteDataSource])
void main() {
  late AnimeCharacterRepositoryImpl sut;
  late AnimeCharacterRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockAnimeCharacterRemoteDataSource();
    sut = AnimeCharacterRepositoryImpl(dataSource: dataSource);
  });

  group('getCharactersForAnime', () {
    test(
      'when dataSource response is success then map element and return success',
      () async {
        const animeId = 1;
        when(dataSource.getCharactersForAnime(animeId: animeId)).thenAnswer(
          (_) async => right(
            [
              const AnimeCharacterModel(
                id: 3,
                name: 'Black, Jet',
                images: AnimeImageModel(
                  jpg: AnimeImageItemModel(
                    imageUrl:
                        'https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839',
                  ),
                  webp: AnimeImageItemModel(
                    imageUrl:
                        'https://cdn.myanimelist.net/images/characters/11/253723.webp?s=6c8a19a79a88c46ae15f30e3ef5fd839',
                  ),
                ),
              ),
            ],
          ),
        );

        final result = await sut.getCharactersForAnime(animeId: animeId);

        expect(result.isRight(), isTrue);
        expect(
          result.rightOrNull(),
          [
            const AnimeCharacterEntity(
              id: '3',
              name: 'Black, Jet',
              imageUrl:
                  'https://cdn.myanimelist.net/images/characters/11/253723.jpg?s=6c8a19a79a88c46ae15f30e3ef5fd839',
            ),
          ],
        );
      },
    );

    test(
      'when dataSource response contains element with null id then discard from the final list',
      () async {
        const animeId = 1;
        when(dataSource.getCharactersForAnime(animeId: animeId)).thenAnswer(
          (_) async => right(
            [
              const AnimeCharacterModel(id: 1, name: 'character 1'),
              const AnimeCharacterModel(id: null, name: 'character 2'),
            ],
          ),
        );

        final result = await sut.getCharactersForAnime(animeId: animeId);

        expect(
          result.rightOrNull(),
          [
            const AnimeCharacterEntity(
              id: '1',
              name: 'character 1',
              imageUrl: '',
            ),
          ],
        );
      },
    );

    test(
      'when dataSource response is Failure then return failure',
      () async {
        const animeId = 1;
        final failure = ApiFailure();
        when(dataSource.getCharactersForAnime(animeId: animeId))
            .thenAnswer((_) async => left(failure));

        final result = await sut.getCharactersForAnime(animeId: animeId);

        expect(result.leftOrNull(), failure);
      },
    );
  });
}
