import 'package:api_call_exercise/core/failures/failures.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_character_entity.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_entity.dart';
import 'package:api_call_exercise/features/anime/domain/usecases/get_anime_characters_by_anime_id_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_details_bloc.freezed.dart';
part 'anime_details_event.dart';
part 'anime_details_state.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  final GetAnimeCharactersByAnimeIdUseCase getAnimeCharactersByAnimeIdUseCase;

  AnimeDetailsBloc({
    required this.getAnimeCharactersByAnimeIdUseCase,
  }) : super(AnimeDetailsState.initial()) {
    on<AnimeDetailsStarted>((event, emit) async {
      emit(state.copyWith(
        anime: event.anime,
        isLoadingCharacters: true,
        charactersFailure: null,
      ));
      final charactersOrFailure = await getAnimeCharactersByAnimeIdUseCase(
        animeId: event.anime.id,
      );
      charactersOrFailure.fold(
        (Failure failure) => emit(state.copyWith(
          isLoadingCharacters: false,
          charactersFailure: failure,
        )),
        (List<AnimeCharacterEntity> characters) => emit(state.copyWith(
          isLoadingCharacters: false,
          characters: characters,
        )),
      );
    });
  }
}
