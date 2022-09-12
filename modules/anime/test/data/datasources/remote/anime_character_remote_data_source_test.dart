import 'package:anime/data/datasources/remote/anime_character_remote_data_source.dart';
import 'package:anime/data/models/anime_character_model.dart';
import 'package:anime/data/models/anime_image_model.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixtures_reader.dart';
import 'anime_character_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late AnimeCharacterRemoteDataSource sut;
  late Dio client;

  setUp(() {
    client = MockDio();
    sut = AnimeCharacterRemoteDataSource(client: client);
  });

  group('getCharactersForAnime', () {
    test('charactersList', () async {
      const animeId = 1;
      when(client.get('anime/$animeId/characters')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: jsonFileToMap('anime_characters.json'),
        ),
      );

      final response = await sut.getCharactersForAnime(animeId: animeId);

      expect(response.isRight(), isTrue);
      expect(
        response.rightOrNull(),
        contains(
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
        ),
      );
    });

    test('ApiFailure', () async {
      const animeId = 1;
      when(client.get('anime/$animeId/characters')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      final response = await sut.getCharactersForAnime(animeId: animeId);

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<ApiFailure>());
    });

    test('UnexpectedFailure', () async {
      const animeId = 1;
      when(client.get('anime/$animeId/characters')).thenThrow(Exception());

      final response = await sut.getCharactersForAnime(animeId: animeId);

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<UnexpectedFailure>());
    });
  });
}
