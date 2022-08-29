import 'dart:io';

import 'package:api_call_exercise/features/anime/anime_entity.dart';
import 'package:api_call_exercise/features/anime/genre_entity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'anime_card.dart';

class AnimeList extends StatelessWidget {
  AnimeList({Key? key, required this.genreFilter}) : super(key: key);

  final Dio dio = Dio();
  final GenreEntity? genreFilter;

  _getDioClient() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<List<AnimeEntity>> _getAnimeList() async {
    _getDioClient();

    String url = 'http://api.jikan.moe/v4';
    if (genreFilter != null) {
      url += '/anime?genres=${genreFilter!.id}';
    } else {
      url += '/top/anime';
    }

    print('Getting animes from url: $url');
    final response = await dio.get(url);
    print(response);
    if (response.statusCode == 200) {
      final animesMap = response.data['data'].map((item) => AnimeEntity.fromJson(item));
      return List<AnimeEntity>.from(animesMap);
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AnimeEntity>>(
      future: _getAnimeList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ));
        }

        final animes = snapshot.data!;

        return ListView.builder(
          itemCount: animes.length,
          itemBuilder: (context, index) => AnimeCard(
            anime: animes[index]
          ),
        );
      }
    );
  }
}