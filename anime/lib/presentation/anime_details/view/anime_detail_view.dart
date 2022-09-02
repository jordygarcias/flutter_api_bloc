import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../di/anime_di.dart';
import '../../../domain/entities/anime_entity.dart';
import '../bloc/anime_details_bloc.dart';
import '../widgets/anime_details.dart';
import '../widgets/character_list.dart';

class AnimeDetailView extends StatelessWidget {
  const AnimeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anime = ModalRoute.of(context)!.settings.arguments as AnimeEntity;

    return Scaffold(
        appBar: AppBar(
          title: Text(anime.name),
        ),
        body: BlocProvider(
          create: (_) => AnimeDi.getIt<AnimeDetailsBloc>()
            ..add(AnimeDetailsStarted(anime: anime)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                AnimeDetail(anime: anime),
                const SizedBox(height: 20),
                const CharacterList(),
              ],
            ),
          ),
        ));
  }
}
