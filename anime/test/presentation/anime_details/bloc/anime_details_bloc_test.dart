import 'package:anime/domain/entities/anime_character_entity.dart';
import 'package:anime/domain/entities/anime_entity.dart';
import 'package:anime/domain/usecases/get_anime_characters_by_anime_id_usecase.dart';
import 'package:anime/presentation/anime_details/bloc/anime_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_details_bloc_test.mocks.dart';

@GenerateMocks([GetAnimeCharactersByAnimeIdUseCase])
void main() {
  late AnimeDetailsBloc sut;
  late GetAnimeCharactersByAnimeIdUseCase getAnimeCharactersByAnimeIdUseCase;

  setUp(() {
    getAnimeCharactersByAnimeIdUseCase =
        MockGetAnimeCharactersByAnimeIdUseCase();
    sut = AnimeDetailsBloc(
        getAnimeCharactersByAnimeIdUseCase: getAnimeCharactersByAnimeIdUseCase);
  });

  blocTest<AnimeDetailsBloc, AnimeDetailsState>(
    'emits [] when nothing is added',
    build: () => sut,
    expect: () => [],
  );

  group('AnimeDetailsStarted is added', () {
    const animeId = '1';
    const animeEntity = AnimeEntity(
      id: animeId,
      name: 'name 1',
      imageUrl: 'https://image1.com',
      synopsis: 'synopsis',
      rating: 'rating',
      score: 0,
      genres: [],
    );
    const characters = [
      AnimeCharacterEntity(
        id: '01',
        name: 'character 1',
        imageUrl: 'https://image1.com',
      ),
    ];
    final failure = ApiFailure();

    blocTest<AnimeDetailsBloc, AnimeDetailsState>(
      'load anime and characters when response is successful',
      build: () {
        when(getAnimeCharactersByAnimeIdUseCase(animeId: animeId))
            .thenAnswer((_) async => right(characters));
        return sut;
      },
      act: (bloc) => bloc.add(AnimeDetailsStarted(anime: animeEntity)),
      expect: () => [
        AnimeDetailsState(
          anime: animeEntity,
          isLoadingCharacters: true,
          characters: [],
          charactersFailure: null,
        ),
        AnimeDetailsState(
          anime: animeEntity,
          isLoadingCharacters: false,
          characters: characters,
          charactersFailure: null,
        ),
      ],
    );

    blocTest<AnimeDetailsBloc, AnimeDetailsState>(
      'load anime and characters when response is failure',
      build: () {
        when(getAnimeCharactersByAnimeIdUseCase(animeId: animeId))
            .thenAnswer((_) async => left(failure));
        return sut;
      },
      act: (bloc) => bloc.add(AnimeDetailsStarted(anime: animeEntity)),
      expect: () => [
        AnimeDetailsState(
          anime: animeEntity,
          isLoadingCharacters: true,
          characters: [],
          charactersFailure: null,
        ),
        AnimeDetailsState(
          anime: animeEntity,
          isLoadingCharacters: false,
          characters: [],
          charactersFailure: failure,
        ),
      ],
    );
  });
}
