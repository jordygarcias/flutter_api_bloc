part of 'anime_bloc.dart';

@freezed
class AnimeState with _$AnimeState {
  factory AnimeState({
    required List<GenreEntity> genres,
    required List<AnimeEntity> animes,
    required bool isLoadingGenres,
    required bool isLoadingTopAnimes,
    Failure? genreListFailure,
    Failure? animeListFailure,
    GenreEntity? selectedGenre,
  }) = _AnimeState;

  factory AnimeState.initial() => AnimeState(
      genres: [],
      animes: [],
      isLoadingGenres: false,
      isLoadingTopAnimes: false,
      genreListFailure: null,
      animeListFailure: null);
}
/*
class AnimeInitialState extends AnimeState {}

class AnimeGenreLoadInProgress extends AnimeState {
  AnimeGenreLoadInProgress() : super(isLoadingGenres: true);
}

class AnimeGenreLoadSuccess extends AnimeState {
  AnimeGenreLoadSuccess({required List<GenreEntity> loadedGenres})
      : super(genres: loadedGenres, isLoadingGenres: false);
}

class AnimeGenreLoadFailure extends AnimeState {
  AnimeGenreLoadFailure() : super(isLoadingGenres: false);
}

class AnimeListLoadInProgress extends AnimeState {
  AnimeListLoadInProgress() : super(isLoadingTopAnimes: true);
}

class AnimeListLoadSuccess extends AnimeState {
  AnimeListLoadSuccess({required List<AnimeEntity> loadedAnimes})
      : super(animes: loadedAnimes, isLoadingTopAnimes: false);
}

class AnimeListLoadFailure extends AnimeState {
  AnimeListLoadFailure() : super(isLoadingTopAnimes: false);
}*/
