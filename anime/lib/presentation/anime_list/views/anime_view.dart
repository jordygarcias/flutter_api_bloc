import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../di/anime_di.dart';
import '../../../domain/entities/genre_entity.dart';
import '../bloc/anime_bloc.dart';
import '../widgets/anime_list.dart';
import '../widgets/genre_list.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animepedia')),
      body: BlocProvider(
        create: (_) => AnimeDi.getIt<AnimeBloc>()
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
