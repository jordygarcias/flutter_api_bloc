import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/anime_character_entity.dart';
import '../bloc/anime_details_bloc.dart';
import 'character_item.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Personajes', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 10),
        BlocBuilder<AnimeDetailsBloc, AnimeDetailsState>(
            builder: (context, state) {
          if (state.isLoadingCharacters) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          } else if (state.charactersFailure != null) {
            return const Center(child: Text('Error al cargar'));
          }

          final List<AnimeCharacterEntity> characters = state.characters;

          return GridView.count(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: characters
                .map((character) => CharacterItem(character: character))
                .toList(),
          );
        })
      ],
    );
  }
}
