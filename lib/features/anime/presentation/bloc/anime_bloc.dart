import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/failures/failures.dart';
import '../../domain/entities/anime_entity.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/usecases/get_anime_genre_list_usecase.dart';
import '../../domain/usecases/get_anime_top_list_usecase.dart';

part 'anime_bloc.freezed.dart';
part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetAnimeGenreListUseCase getAnimeGenreListUseCase;
  final GetAnimeTopListUseCase getAnimeTopListUseCase;

  AnimeBloc({
    required this.getAnimeGenreListUseCase,
    required this.getAnimeTopListUseCase,
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
      emit(state.copyWith(isLoadingTopAnimes: true, animeListFailure: null));
      final listOrFailure = await getAnimeTopListUseCase();

      listOrFailure.fold(
          (Failure failure) => emit(state.copyWith(
              isLoadingTopAnimes: false, animeListFailure: failure)),
          (List<AnimeEntity> animes) =>
              emit(state.copyWith(animes: animes, isLoadingTopAnimes: false)));
    });

    on<AnimeGenreSelected>((event, emit) async {
      emit(state.copyWith(selectedGenre: event.selectedGenre));
    });
  }
}
