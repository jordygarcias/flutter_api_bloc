import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/anime_bloc.dart';
import 'anime_card.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeBloc, AnimeState>(builder: (context, state) {
      if (state.isLoadingAnimes) {
        return Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ));
      } else if (state.animeListFailure != null) {
        return const Center(child: Text('Error al cargar'));
      }

      final animes = state.animes;
      return ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) => AnimeCard(anime: animes[index]),
      );
    });
  }
}
