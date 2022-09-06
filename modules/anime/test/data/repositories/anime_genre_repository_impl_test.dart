import 'package:anime/data/datasources/remote/anime_genre_remote_datasource.dart';
import 'package:anime/data/models/anime_genre_model.dart';
import 'package:anime/data/repositories/anime_genre_respository_impl.dart';
import 'package:anime/domain/entities/genre_entity.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_genre_repository_impl_test.mocks.dart';

@GenerateMocks([AnimeGenreRemoteDataSource])
void main() {
  late AnimeGenreRepositoryImpl sut;
  late AnimeGenreRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockAnimeGenreRemoteDataSource();
    sut = AnimeGenreRepositoryImpl(dataSource: dataSource);
  });

  group('getAnimeGenreList', () {
    test(
      'when dataSource response is success then map element and return success',
      () async {
        when(dataSource.getAnimeGenreList()).thenAnswer(
          (_) async => right(
            [
              const AnimeGenreModel(id: 1, name: 'Action'),
              const AnimeGenreModel(id: 2, name: 'Adventure'),
            ],
          ),
        );

        final result = await sut.getAnimeGenreList();

        expect(result.isRight(), isTrue);
        expect(
          result.rightOrNull(),
          [
            const GenreEntity(id: '1', name: 'Action'),
            const GenreEntity(id: '2', name: 'Adventure'),
          ],
        );
      },
    );

    test(
      'when dataSource response contains element with null id then discard from the final list',
      () async {
        when(dataSource.getAnimeGenreList()).thenAnswer(
          (_) async => right(
            [
              const AnimeGenreModel(id: null, name: 'Action'),
              const AnimeGenreModel(id: 2, name: 'Adventure'),
            ],
          ),
        );

        final result = await sut.getAnimeGenreList();

        expect(
          result.rightOrNull(),
          [
            const GenreEntity(id: '2', name: 'Adventure'),
          ],
        );
      },
    );

    test(
      'when dataSource response is Failure then return failure',
      () async {
        final failure = ApiFailure();
        when(dataSource.getAnimeGenreList())
            .thenAnswer((_) async => left(failure));

        final result = await sut.getAnimeGenreList();

        expect(result.leftOrNull(), failure);
      },
    );
  });
}
