import 'package:api_call_exercise/features/anime/anime_detail.dart';
import 'package:api_call_exercise/features/anime/anime_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
        )
      ),
      home: const AnimeHome(),
      routes: {
        'home': (_) => const AnimeHome(),
        'detail': (_) => AnimeDetail(),
      },
    );
  }
}