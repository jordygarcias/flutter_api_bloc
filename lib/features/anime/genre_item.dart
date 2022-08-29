import 'package:api_call_exercise/features/anime/genre_entity.dart';
import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final bool isSelected;
  final GenreEntity genre;
  final Function onSelectGenre;

  const GenreItem({
    Key? key,
    required this.genre,
    required this.onSelectGenre,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelectGenre(genre),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
              ? const Color(0xFFF9035A)
              : const Color(0xFFF9EDD8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child:  Text(
            genre.name,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: isSelected
                ? const Color(0xFFF9EDD8)
                : const Color(0xFFF9035A),
            )
          ),
        ),
      ),
    );
  }
}