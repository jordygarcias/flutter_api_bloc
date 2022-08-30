part of 'anime_bloc.dart';

abstract class AnimeState {
  final List<GenreEntity> genres;

  AnimeState({this.genres = const []});
}

class AnimeInitialState extends AnimeState {}

class AnimeLoadingGenres extends AnimeState {}

class AnimeSuccessLoadingGenres extends AnimeState {
  AnimeSuccessLoadingGenres({required List<GenreEntity> loadedGenres})
      : super(genres: loadedGenres);
}

class AnimeErrorLoadingGenres extends AnimeState {}
