import 'package:bloc/bloc.dart';
import '../../domain/entities/genre_entity.dart';
import '../../domain/usecases/get_anime_genre_list_usecase.dart';

part 'anime_state.dart';
part 'anime_event.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  final GetAnimeGenreListUseCase getAnimeGenreListUseCase;

  AnimeBloc({required this.getAnimeGenreListUseCase})
      : super(AnimeInitialState()) {
    on<GetAnimeGenreList>((event, emit) async {
      emit(AnimeLoadingGenres());
      final listOrFailure = await getAnimeGenreListUseCase();

      listOrFailure.fold(
          (_) => emit(AnimeErrorLoadingGenres()),
          (List<GenreEntity> genres) =>
              emit(AnimeSuccessLoadingGenres(loadedGenres: genres)));
    });
  }
}
