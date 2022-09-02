import 'dart:io';

import 'package:api_call_exercise/features/anime/character_item.dart';
import 'package:api_call_exercise/features/anime/domain/entities/anime_character_entity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'domain/entities/anime_entity.dart';

class AnimeDetail extends StatelessWidget {
  AnimeDetail({Key? key}) : super(key: key);

  final Dio dio = Dio();

  _getDioClient() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<List<AnimeCharacterEntity>> _getAnimeCharactersList(animeId) async {
    _getDioClient();
    final response =
        await dio.get('https://api.jikan.moe/v4/anime/$animeId/characters');
    if (response.statusCode == 200) {
      final charactersMap = response.data['data']
          .map((item) => AnimeCharacterEntity.fromJson(item['character']));
      return List<AnimeCharacterEntity>.from(charactersMap);
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final anime = ModalRoute.of(context)!.settings.arguments as AnimeEntity;

    return Scaffold(
        appBar: AppBar(
          title: Text(anime.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(
                  child: Hero(
                tag: anime.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                      width: 180,
                      height: 180,
                      child:
                          Image.network(anime.imageUrl, fit: BoxFit.fitWidth)),
                ),
              )),
              const SizedBox(height: 20),
              Text('Sinopsis', style: Theme.of(context).textTheme.headline5),
              const SizedBox(height: 10),
              Text(
                anime.synopsis,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 30),
              Text('Géneros', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: anime.genres
                    .map((genre) => Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(genre.name,
                            style: Theme.of(context).textTheme.bodyMedium)))
                    .toList(),
              ),
              const SizedBox(height: 20),
              Text('Personajes', style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 10),
              FutureBuilder<List<AnimeCharacterEntity>>(
                  future: _getAnimeCharactersList(anime.id),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final List<AnimeCharacterEntity> characters =
                        snapshot.data!;

                    return GridView.count(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      crossAxisCount: 4,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: characters
                          .map((character) =>
                              CharacterItem(character: character))
                          .toList(),
                    );
                  })
            ],
          ),
        ));
  }
}
