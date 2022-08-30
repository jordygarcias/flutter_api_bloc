import 'dart:io';

import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'genre_item.dart';

class GenreList extends StatelessWidget {
  GenreList({Key? key, required this.onSelectGenre, this.selectedGenre})
      : super(key: key);

  final Dio dio = Dio();
  final Function onSelectGenre;
  final GenreEntity? selectedGenre;

  _getDioClient() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<List<GenreEntity>> _getGenreList() async {
    _getDioClient();
    final response = await dio.get('http://api.jikan.moe/v4/genres/anime');
    if (response.statusCode == 200) {
      final genres =
          response.data['data'].map((item) => GenreEntity.fromJson(item));
      return List<GenreEntity>.from(genres);
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        height: 60,
        child: FutureBuilder<List<GenreEntity>>(
          future: _getGenreList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Color(0xFFF9035A),
              ));
            }

            final List<GenreEntity> genres = snapshot.data!;

            return ListView.builder(
              itemCount: genres.length,
              itemBuilder: (context, index) => GenreItem(
                  genre: genres[index],
                  isSelected: selectedGenre?.id == genres[index].id,
                  onSelectGenre: (GenreEntity genre) => onSelectGenre(genre)),
              scrollDirection: Axis.horizontal,
            );
          },
        ));
  }
}
