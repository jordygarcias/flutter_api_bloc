import 'package:api_call_exercise/features/anime/anime_list.dart';
import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';
import 'package:api_call_exercise/features/anime/genre_list.dart';
import 'package:flutter/material.dart';

class AnimeHome extends StatefulWidget {
  const AnimeHome({Key? key}) : super(key: key);

  @override
  State<AnimeHome> createState() => _AnimeHomeState();
}

class _AnimeHomeState extends State<AnimeHome> {
  GenreEntity? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animepedia')),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: GenreList(
              selectedGenre: _selectedGenre,
              onSelectGenre: (GenreEntity genre) => setState(() {
                _selectedGenre = genre;
              }),
            ),
          ),
          Expanded(
              child: AnimeList(
            genreFilter: _selectedGenre,
          ))
        ],
      ),
      //? Add bottom navigation bar with Favs & Home tabs?
    );
  }
}
