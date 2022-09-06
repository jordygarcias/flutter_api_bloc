import 'package:anime/data/datasources/remote/anime_genre_remote_datasource.dart';
import 'package:anime/data/models/anime_genre_model.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixtures_reader.dart';
import 'anime_genre_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late AnimeGenreRemoteDataSource sut;
  late Dio client;

  setUp(() {
    client = MockDio();
    sut = AnimeGenreRemoteDataSource(client: client);
  });

  //  Note: Assert and expect both fail the test when the condition is not satisfied.
  //        Assert returns message response.isLeft() is not true.
  //            assert(response.isLeft());
  //        Expect returns message expected <true> actual <false>
  //            expect(response.isLeft(), true);

  group('getAnimeGenreList', () {
    test('genresList', () async {
      when(client.get('genres/anime')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 200,
          data: jsonFileToMap('genres.json'),
        ),
      );

      final response = await sut.getAnimeGenreList();

      expect(response.isRight(), isTrue);
      expect(
        response.rightOrNull(),
        contains(AnimeGenreModel(id: 1, name: 'Action')),
      );
    });

    test('ApiFailure', () async {
      when(client.get('genres/anime')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 404,
        ),
      );

      final response = await sut.getAnimeGenreList();

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<ApiFailure>());
    });

    test('UnexpectedFailure', () async {
      when(client.get('genres/anime')).thenThrow(Exception());

      final response = await sut.getAnimeGenreList();

      expect(response.isLeft(), isTrue);
      expect(response.leftOrNull(), isA<UnexpectedFailure>());
    });
  });
}
