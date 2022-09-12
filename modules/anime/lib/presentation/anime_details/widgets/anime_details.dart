import 'package:flutter/material.dart';

import '../../../domain/entities/anime_entity.dart';

class AnimeDetail extends StatelessWidget {
  final AnimeEntity anime;

  const AnimeDetail({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Hero(
            tag: anime.name,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 180,
                height: 180,
                child: Image.network(anime.imageUrl, fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text('Sinopsis', style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 10),
        Text(
          anime.synopsis,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 30),
        Text('Géneros', style: Theme.of(context).textTheme.headline6),
        const SizedBox(height: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: anime.genres
              .map((genre) => Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Text(genre.name,
                      style: Theme.of(context).textTheme.bodyMedium)))
              .toList(),
        ),
      ],
    );
  }
}
