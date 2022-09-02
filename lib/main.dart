import 'package:api_call_exercise/di/app_di.dart' as di;
import 'package:api_call_exercise/features/anime/presentation/anime_details/view/anime_detail_view.dart';
import 'package:flutter/material.dart';

import 'features/anime/presentation/anime_list/views/anime_view.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Call Exercise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFFFFC500),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF195198),
          )),
      initialRoute: 'home',
      routes: {
        'home': (_) => const AnimeView(),
        'detail': (_) => AnimeDetailView(),
      },
    );
  }
}
