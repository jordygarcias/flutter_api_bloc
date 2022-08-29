import 'package:api_call_exercise/features/anime/anime_character_entity.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final AnimeCharacterEntity character;

  const CharacterItem({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 60,
            height: 60,
            child: Image.network(character.imageUrl, fit: BoxFit.fitWidth)
          )
        ),
        const SizedBox(height: 3),
        Text(
          character.name,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis
        ),
      ]
    );
  }
}