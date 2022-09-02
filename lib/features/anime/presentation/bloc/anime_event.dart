part of 'anime_bloc.dart';

abstract class AnimeEvent {}

class AnimeGenreListStarted extends AnimeEvent {}

class AnimeListStarted extends AnimeEvent {}

class AnimeGenreSelected extends AnimeEvent {
  final GenreEntity selectedGenre;
  AnimeGenreSelected(this.selectedGenre);
}
