import 'package:api_call_exercise/features/anime/data/datasources/remote/anime_character_remote_data_source.dart';
import 'package:api_call_exercise/features/anime/data/repositories/anime_character_repository_impl.dart';
import 'package:api_call_exercise/features/anime/domain/repositories/anime_character_repository.dart';
import 'package:api_call_exercise/features/anime/domain/usecases/get_anime_by_genre_use_case.dart';
import 'package:api_call_exercise/features/anime/domain/usecases/get_anime_characters_by_anime_id_usecase.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_details/bloc/anime_details_bloc.dart';

import '../../../di/app_di.dart';
import '../data/datasources/remote/anime_genre_remote_datasource.dart';
import '../data/datasources/remote/anime_remote_datasource.dart';
import '../data/repositories/anime_genre_respository_impl.dart';
import '../data/repositories/anime_repository_impl.dart';
import '../domain/repositories/anime_genre_respository.dart';
import '../domain/repositories/anime_repository.dart';
import '../domain/usecases/get_anime_genre_list_usecase.dart';
import '../presentation/anime_list/bloc/anime_bloc.dart';

class AnimeDi {
  static void init() {
    //  DataSources
    getIt.registerLazySingleton<AnimeGenreRemoteDataSource>(
        () => AnimeGenreRemoteDataSource(client: getIt()));
    getIt.registerLazySingleton<AnimeRemoteDataSource>(
        () => AnimeRemoteDataSource(client: getIt()));
    getIt.registerLazySingleton<AnimeCharacterRemoteDataSource>(
        () => AnimeCharacterRemoteDataSource(client: getIt()));

    //  Repositories
    getIt.registerLazySingleton<AnimeGenreRepository>(
        () => AnimeGenreRepositoryImpl(dataSource: getIt()));
    getIt.registerLazySingleton<AnimeRepository>(
        () => AnimeRepositoryImpl(datasource: getIt()));
    getIt.registerLazySingleton<AnimeCharacterRepository>(
        () => AnimeCharacterRepositoryImpl(dataSource: getIt()));

    //  UseCases
    getIt.registerFactory<GetAnimeByGenreUseCase>(
        () => GetAnimeByGenreUseCase(repository: getIt()));
    getIt.registerFactory<GetAnimeGenreListUseCase>(
        () => GetAnimeGenreListUseCase(repository: getIt()));
    getIt.registerFactory<GetAnimeCharactersByAnimeIdUseCase>(
        () => GetAnimeCharactersByAnimeIdUseCase(repository: getIt()));

    //  Blocs
    getIt.registerFactory<AnimeBloc>(() => AnimeBloc(
          getAnimeGenreListUseCase: getIt(),
          getAnimeByGenreUseCase: getIt(),
        ));
    getIt.registerFactory<AnimeDetailsBloc>(
      () => AnimeDetailsBloc(getAnimeCharactersByAnimeIdUseCase: getIt()),
    );
  }
}
