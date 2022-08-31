import 'package:flutter/material.dart';

import '../../domain/entities/anime_entity.dart';

class AnimeCard extends StatelessWidget {
  final AnimeEntity anime;

  const AnimeCard({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 120,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('detail', arguments: anime);
              },
              child: Hero(
                tag: anime.name,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Image.network(anime.imageUrl, fit: BoxFit.cover)),
                ),
              ),
            ),
            _AnimeCardDetail(anime: anime),
          ],
        ));
  }
}

class _AnimeCardDetail extends StatelessWidget {
  final AnimeEntity anime;

  const _AnimeCardDetail({
    Key? key,
    required this.anime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(anime.name,
                  maxLines: 2, style: Theme.of(context).textTheme.headline5),
            ),
            Text(anime.rating,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 10),
            Expanded(
                child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Score: ${anime.score}/10',
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
            ))
          ],
        ));
  }
}
