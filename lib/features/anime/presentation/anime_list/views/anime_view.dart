import 'package:api_call_exercise/di/app_di.dart';
import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_list/bloc/anime_bloc.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_list/widgets/anime_list.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_list/widgets/genre_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/genre_list.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({Key? key}) : super(key: key);

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
              child: BlocBuilder<AnimeBloc, AnimeState>(
                buildWhen: (previous, current) =>
                    previous.selectedGenre != current.selectedGenre,
                builder: (context, state) => GenreList(
                  selectedGenre: state.selectedGenre,
                  onSelectGenre: (genre) => dispatchSelectGenre(context, genre),
                ),
              ),
            ),
            const Expanded(child: AnimeList())
          ],
        ),
      ),
    );
  }

  void dispatchSelectGenre(BuildContext context, GenreEntity selectedGenre) =>
      context.read<AnimeBloc>().add(AnimeGenreSelected(selectedGenre));
}
