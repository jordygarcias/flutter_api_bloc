part of 'anime_details_bloc.dart';

@freezed
class AnimeDetailsState with _$AnimeDetailsState {
  factory AnimeDetailsState({
    AnimeEntity? anime,
    required bool isLoadingCharacters,
    required List<AnimeCharacterEntity> characters,
    Failure? charactersFailure,
  }) = _AnimeDetailsState;

  factory AnimeDetailsState.initial() => AnimeDetailsState(
        anime: null,
        isLoadingCharacters: false,
        characters: [],
        charactersFailure: null,
      );
}
