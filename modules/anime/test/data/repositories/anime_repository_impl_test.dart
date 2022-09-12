import 'package:anime/data/datasources/remote/anime_remote_datasource.dart';
import 'package:anime/data/models/anime_genre_model.dart';
import 'package:anime/data/models/anime_image_model.dart';
import 'package:anime/data/models/anime_model.dart';
import 'package:anime/data/repositories/anime_repository_impl.dart';
import 'package:anime/domain/entities/anime_entity.dart';
import 'package:anime/domain/entities/genre_entity.dart';
import 'package:core/extensions/either_extensions.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_repository_impl_test.mocks.dart';

@GenerateMocks([AnimeRemoteDataSource])
void main() {
  late AnimeRepositoryImpl sut;
  late AnimeRemoteDataSource dataSource;

  setUp(() {
    dataSource = MockAnimeRemoteDataSource();
    sut = AnimeRepositoryImpl(datasource: dataSource);
  });

  group('getAnimeTopList', () {
    test(
      'when dataSource response is success then map element and return success',
      () async {
        when(dataSource.getAnimeTopList()).thenAnswer(
          (_) async => right(
            [_animeModel1],
          ),
        );

        final result = await sut.getAnimeTopList();

        expect(result.isRight(), isTrue);
        expect(
          result.rightOrNull(),
          [_animeEntity1],
        );
      },
    );

    test(
      'when dataSource response contains element with null id then discard from the final list',
      () async {
        when(dataSource.getAnimeTopList()).thenAnswer(
          (_) async => right(
            [
              const AnimeModel(id: 1, name: 'anime1'),
              const AnimeModel(id: null, name: 'anime2'),
            ],
          ),
        );

        final result = await sut.getAnimeTopList();

        expect(
          result.rightOrNull(),
          [
            const AnimeEntity(
              id: '1',
              name: 'anime1',
              imageUrl: '',
              synopsis: '',
              rating: '',
              score: 0,
              genres: [],
            ),
          ],
        );
      },
    );

    test(
      'when dataSource response is Failure then return failure',
      () async {
        final failure = ApiFailure();
        when(dataSource.getAnimeTopList())
            .thenAnswer((_) async => left(failure));

        final result = await sut.getAnimeTopList();

        expect(result.leftOrNull(), failure);
      },
    );
  });

  group('getAnimeByGenre', () {
    test(
      'when dataSource response is success then map element and return success',
      () async {
        const genreId = 1;
        when(dataSource.getAnimeByGenre(genreId)).thenAnswer(
          (_) async => right(
            [_animeModel1],
          ),
        );

        final result = await sut.getAnimeByGenre(genreId);

        expect(result.isRight(), isTrue);
        expect(
          result.rightOrNull(),
          [_animeEntity1],
        );
      },
    );

    test(
      'when dataSource response contains element with null id then discard from the final list',
      () async {
        const genreId = 1;
        when(dataSource.getAnimeByGenre(genreId)).thenAnswer(
          (_) async => right(
            [
              const AnimeModel(id: 1, name: 'anime1'),
              const AnimeModel(id: null, name: 'anime2'),
            ],
          ),
        );

        final result = await sut.getAnimeByGenre(genreId);

        expect(
          result.rightOrNull(),
          [
            const AnimeEntity(
              id: '1',
              name: 'anime1',
              imageUrl: '',
              synopsis: '',
              rating: '',
              score: 0,
              genres: [],
            ),
          ],
        );
      },
    );

    test(
      'when dataSource response is Failure then return failure',
      () async {
        const genreId = 1;
        final failure = ApiFailure();
        when(dataSource.getAnimeByGenre(genreId))
            .thenAnswer((_) async => left(failure));

        final result = await sut.getAnimeByGenre(genreId);

        expect(result.leftOrNull(), failure);
      },
    );
  });
}

const _animeModel1 = AnimeModel(
  id: 1,
  name: 'name1',
  images: AnimeImageModel(
    jpg: AnimeImageItemModel(imageUrl: 'https://image1.com'),
  ),
  synopsis: 'synopsis1',
  rating: 'rating1',
  score: 0,
  genres: [AnimeGenreModel(id: 1, name: 'Action')],
);

const _animeEntity1 = AnimeEntity(
  id: '1',
  name: 'name1',
  imageUrl: 'https://image1.com',
  synopsis: 'synopsis1',
  rating: 'rating1',
  score: 0,
  genres: [GenreEntity(id: '1', name: 'Action')],
);
