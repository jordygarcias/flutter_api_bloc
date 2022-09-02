import 'package:core/failures/failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/anime_entity.dart';
import '../../../domain/entities/genre_entity.dart';
import '../../../domain/usecases/get_anime_by_genre_use_case.dart';
import '../../../domain/usecases/get_anime_genre_list_usecase.dart';

part 'anime_bloc.freezed.dart';
part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetAnimeGenreListUseCase getAnimeGenreListUseCase;
  final GetAnimeByGenreUseCase getAnimeByGenreUseCase;

  AnimeBloc({
    required this.getAnimeGenreListUseCase,
    required this.getAnimeByGenreUseCase,
  }) : super(AnimeState.initial()) {
    on<AnimeGenreListStarted>((event, emit) async {
      emit(state.copyWith(isLoadingGenres: true, genreListFailure: null));
      final listOrFailure = await getAnimeGenreListUseCase();

      listOrFailure.fold(
          (Failure failure) => emit(state.copyWith(
              isLoadingGenres: false, genreListFailure: failure)),
          (List<GenreEntity> genres) =>
              emit(state.copyWith(genres: genres, isLoadingGenres: false)));
    });

    on<AnimeListStarted>((event, emit) async {
      emit(state.copyWith(isLoadingAnimes: true, animeListFailure: null));
      final selectedGenre = state.selectedGenre;
      final selectedGenreId =
          selectedGenre != null ? int.tryParse(selectedGenre.id) : null;
      final listOrFailure = await getAnimeByGenreUseCase(selectedGenreId);

      listOrFailure.fold(
          (Failure failure) => emit(state.copyWith(
              isLoadingAnimes: false, animeListFailure: failure)),
          (List<AnimeEntity> animes) =>
              emit(state.copyWith(animes: animes, isLoadingAnimes: false)));
    });

    on<AnimeGenreSelected>((event, emit) async {
      emit(state.copyWith(selectedGenre: event.selectedGenre));
      add(AnimeListStarted());
    });
  }
}
