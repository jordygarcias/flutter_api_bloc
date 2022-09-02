import 'package:anime/navigation/anime_details_args.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../di/anime_di.dart';
import '../bloc/anime_details_bloc.dart';
import '../widgets/anime_details.dart';
import '../widgets/character_list.dart';

class AnimeDetailView extends StatelessWidget {
  final AnimeDetailArgs args;

  const AnimeDetailView({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(args.anime.name),
        ),
        body: BlocProvider(
          create: (_) => AnimeDi.getIt<AnimeDetailsBloc>()
            ..add(AnimeDetailsStarted(anime: args.anime)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                AnimeDetail(anime: args.anime),
                const SizedBox(height: 20),
                const CharacterList(),
              ],
            ),
          ),
        ));
  }
}
