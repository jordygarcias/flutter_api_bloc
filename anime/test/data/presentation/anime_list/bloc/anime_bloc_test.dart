import 'package:anime/domain/entities/anime_entity.dart';
import 'package:anime/domain/entities/genre_entity.dart';
import 'package:anime/domain/usecases/get_anime_by_genre_use_case.dart';
import 'package:anime/domain/usecases/get_anime_genre_list_usecase.dart';
import 'package:anime/presentation/anime_list/bloc/anime_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_bloc_test.mocks.dart';

@GenerateMocks([GetAnimeGenreListUseCase, GetAnimeByGenreUseCase])
void main() {
  late AnimeBloc sut;
  late GetAnimeGenreListUseCase getAnimeGenreListUseCase;
  late GetAnimeByGenreUseCase getAnimeByGenreUseCase;

  setUp(() {
    getAnimeGenreListUseCase = MockGetAnimeGenreListUseCase();
    getAnimeByGenreUseCase = MockGetAnimeByGenreUseCase();
    sut = AnimeBloc(
      getAnimeGenreListUseCase: getAnimeGenreListUseCase,
      getAnimeByGenreUseCase: getAnimeByGenreUseCase,
    );
  });

  blocTest<AnimeBloc, AnimeState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('AnimeGenreListStarted is added', () {
    final failure = ApiFailure();
    blocTest<AnimeBloc, AnimeState>(
      'load genres when response is successful',
      build: () {
        when(getAnimeGenreListUseCase()).thenAnswer((_) async => right([
              const GenreEntity(id: '1', name: 'Action'),
              const GenreEntity(id: '2', name: 'Adventure'),
            ]));
        return sut;
      },
      act: (bloc) => bloc.add(AnimeGenreListStarted()),
      expect: () => [
        AnimeState.initial().copyWith(isLoadingGenres: true),
        AnimeState(
          genres: [
            const GenreEntity(id: '1', name: 'Action'),
            const GenreEntity(id: '2', name: 'Adventure'),
          ],
          animes: [],
          isLoadingGenres: false,
          isLoadingAnimes: false,
        ),
      ],
    );
    blocTest<AnimeBloc, AnimeState>(
      'load genresFailure when response is failure',
      build: () {
        when(getAnimeGenreListUseCase()).thenAnswer(
          (_) async => left(failure),
        );
        return sut;
      },
      act: (bloc) => bloc.add(AnimeGenreListStarted()),
      expect: () => [
        AnimeState.initial().copyWith(isLoadingGenres: true),
        AnimeState(
          genres: [],
          animes: [],
          isLoadingGenres: false,
          isLoadingAnimes: false,
          genreListFailure: failure,
        ),
      ],
    );
  });

  group('AnimeListStarted', () {
    const genreId = null;
    const animeEntity = AnimeEntity(
      id: '1',
      name: 'name',
      imageUrl: 'imageUrl',
      synopsis: 'synopsis',
      rating: 'rating',
      score: 0,
      genres: [],
    );
    final failure = ApiFailure();

    blocTest<AnimeBloc, AnimeState>(
      'loadAnimeList when response was successful',
      build: () {
        when(getAnimeByGenreUseCase(genreId)).thenAnswer(
          (_) async => right([animeEntity]),
        );
        return sut;
      },
      act: (bloc) => bloc.add(AnimeListStarted()),
      expect: () => [
        AnimeState.initial().copyWith(isLoadingAnimes: true),
        AnimeState(
          genres: [],
          animes: [animeEntity],
          isLoadingGenres: false,
          isLoadingAnimes: false,
        )
      ],
    );
    blocTest<AnimeBloc, AnimeState>(
      'loadAnimeFailure when response was failure',
      build: () {
        when(getAnimeByGenreUseCase(genreId))
            .thenAnswer((_) async => left(failure));
        return sut;
      },
      act: (bloc) => bloc.add(AnimeListStarted()),
      expect: () => [
        AnimeState.initial().copyWith(isLoadingAnimes: true),
        AnimeState(
          genres: [],
          animes: [],
          isLoadingGenres: false,
          isLoadingAnimes: false,
          animeListFailure: failure,
        ),
      ],
    );
  });

  group('AnimeGenreSelected', () {
    const genreId = 1;
    const selectedGenre = GenreEntity(
      id: '1',
      name: 'Action',
    );
    const animeEntity = AnimeEntity(
      id: '1',
      name: 'name',
      imageUrl: 'imageUrl',
      synopsis: 'synopsis',
      rating: 'rating',
      score: 0,
      genres: [],
    );

    blocTest<AnimeBloc, AnimeState>(
      'select genres and call animeList to load',
      build: () {
        when(getAnimeByGenreUseCase(genreId)).thenAnswer(
          (_) async => right([animeEntity]),
        );
        return sut;
      },
      act: (bloc) => bloc.add(
        AnimeGenreSelected(
          GenreEntity(
            id: genreId.toString(),
            name: 'Action',
          ),
        ),
      ),
      expect: () => [
        AnimeState.initial().copyWith(selectedGenre: selectedGenre),
        AnimeState.initial().copyWith(
          selectedGenre: selectedGenre,
          isLoadingAnimes: true,
        ),
        AnimeState(
          selectedGenre: selectedGenre,
          isLoadingAnimes: false,
          animes: [animeEntity],
          genres: [],
          isLoadingGenres: false,
        )
      ],
    );
  });
}
