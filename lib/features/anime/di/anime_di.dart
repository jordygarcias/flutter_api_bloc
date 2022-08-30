import '../../../di/app_di.dart';
import '../data/datasources/remote/anime_genre_remote_datasource.dart';
import '../data/repositories/anime_genre_respository_impl.dart';
import '../domain/repositories/anime_genre_respository.dart';
import '../domain/usecases/get_anime_genre_list_usecase.dart';
import '../presentation/bloc/anime_bloc.dart';

class AnimeDi {
  static void init() {
    getIt.registerLazySingleton<AnimeGenreRemoteDataSource>(() =>
        AnimeGenreRemoteDataSource(client: getIt()));
    getIt.registerLazySingleton<AnimeGenreRepository>(() =>
        AnimeGenreRepositoryImpl(dataSource: getIt()));
    getIt.registerFactory<GetAnimeGenreListUseCase>(
        () => GetAnimeGenreListUseCase(repository: getIt()));
    getIt.registerFactory<AnimeBloc>(() => AnimeBloc(
          getAnimeGenreListUseCase: getIt(),
        ));
  }
}
