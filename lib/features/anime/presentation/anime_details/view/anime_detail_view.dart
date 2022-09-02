import 'package:api_call_exercise/di/app_di.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_details/bloc/anime_details_bloc.dart';
import 'package:api_call_exercise/features/anime/presentation/anime_details/widgets/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/anime_entity.dart';
import '../widgets/anime_details.dart';

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
          create: (_) =>
              getIt<AnimeDetailsBloc>()..add(AnimeDetailsStarted(anime: anime)),
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
