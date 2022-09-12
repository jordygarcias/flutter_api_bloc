import 'package:anime/data/datasources/remote/anime_remote_datasource.dart';
import 'package:anime/data/models/anime_genre_model.dart';
import 'package:anime/data/models/anime_image_model.dart';
import 'package:anime/data/models/anime_model.dart';
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
  late AnimeRemoteDataSource sut;
  late Dio client;

  setUp(() {
    client = MockDio();
    sut = AnimeRemoteDataSource(client: client);
  });

  group('getAnimeTopList', () {
    test('animeList', () async {
      when(client.get('top/anime')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: jsonFileToMap('top_animes.json'),
        ),
      );

      final response = await sut.getAnimeTopList();

      expect(response.isRight(), isTrue);
      expect(response.rightOrNull(), contains(_animeFirst));
    });

    test('ApiFailure', () async {
      when(client.get('top/anime')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      final response = await sut.getAnimeTopList();

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<ApiFailure>());
    });

    test('UnexpectedFailure', () async {
      when(client.get('top/anime')).thenThrow(Exception());
      final response = await sut.getAnimeTopList();
      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<UnexpectedFailure>());
    });
  });

  group('getAnimeByGenre', () {
    test('animeList', () async {
      const genreId = 1;
      when(client.get('anime?genres=$genreId')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: jsonFileToMap('top_animes.json'),
        ),
      );

      final response = await sut.getAnimeByGenre(genreId);

      expect(response.isRight(), isTrue);
      expect(response.rightOrNull(), contains(_animeFirst));
    });

    test('ApiFailure', () async {
      const genreId = 1;
      when(client.get('anime?genres=$genreId')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      final response = await sut.getAnimeByGenre(genreId);

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<ApiFailure>());
    });

    test('UnexpectedFailure', () async {
      const genreId = 1;
      when(client.get('anime?genres=$genreId')).thenThrow(Exception());
      final response = await sut.getAnimeTopList();
      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<UnexpectedFailure>());
    });
  });
}

const _animeFirst = AnimeModel(
  id: 5114,
  name: 'Fullmetal Alchemist: Brotherhood',
  images: AnimeImageModel(
    jpg: AnimeImageItemModel(
        imageUrl: 'https://cdn.myanimelist.net/images/anime/1223/96541.jpg'),
    webp: AnimeImageItemModel(
        imageUrl: 'https://cdn.myanimelist.net/images/anime/1223/96541.webp'),
  ),
  synopsis:
      'After a horrific alchemy experiment goes wrong in the Elric household, brothers Edward and Alphonse are left in a catastrophic new reality. Ignoring the alchemical principle banning human transmutation, the boys attempted to bring their recently deceased mother back to life. Instead, they suffered brutal personal loss: Alphonse\'s body disintegrated while Edward lost a leg and then sacrificed an arm to keep Alphonse\'s soul in the physical realm by binding it to a hulking suit of armor. The brothers are rescued by their neighbor Pinako Rockbell and her granddaughter Winry. Known as a bio-mechanical engineering prodigy, Winry creates prosthetic limbs for Edward by utilizing "automail," a tough, versatile metal used in robots and combat armor. After years of training, the Elric brothers set off on a quest to restore their bodies by locating the Philosopher\'s Stone—a powerful gem that allows an alchemist to defy the traditional laws of Equivalent Exchange. As Edward becomes an infamous alchemist and gains the nickname "Fullmetal," the boys\' journey embroils them in a growing conspiracy that threatens the fate of the world. [Written by MAL Rewrite]',
  rating: 'R - 17+ (violence & profanity)',
  score: 9.13,
  genres: [
    AnimeGenreModel(id: 1, name: 'Action'),
    AnimeGenreModel(id: 2, name: 'Adventure'),
    AnimeGenreModel(id: 8, name: 'Drama'),
    AnimeGenreModel(id: 10, name: 'Fantasy'),
  ],
);
