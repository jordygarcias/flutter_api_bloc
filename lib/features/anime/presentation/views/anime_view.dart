import 'package:api_call_exercise/features/anime/presentation/widgets/anime_list.dart';
import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';
import 'package:api_call_exercise/features/anime/presentation/widgets/genre_list.dart';
import 'package:api_call_exercise/features/anime/presentation/bloc/anime_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/app_di.dart';
import '../widgets/genre_list.dart';

class AnimeView extends StatefulWidget {
  const AnimeView({Key? key}) : super(key: key);

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> {
  GenreEntity? _selectedGenre;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animepedia')),
      body: BlocProvider(
        create: (_) => getIt<AnimeBloc>()
          ..add(AnimeGenreListStarted())
          ..add(AnimeListStarted()),
        child: Column(
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
            const Expanded(child: AnimeList())
          ],
        ),
      ),
    );
  }
}
