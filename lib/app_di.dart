import 'package:anime/di/anime_di.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  final dio = Dio();
  dio.options.baseUrl = 'http://api.jikan.moe/v4/';
  getIt.registerLazySingleton<Dio>(() => dio);

  AnimeDi.init();
}
