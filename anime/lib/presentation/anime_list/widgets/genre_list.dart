import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/genre_entity.dart';
import '../bloc/anime_bloc.dart';
import 'genre_item.dart';

class GenreList extends StatelessWidget {
  final void Function(GenreEntity) onSelectGenre;
  final GenreEntity? selectedGenre;

  const GenreList({Key? key, required this.onSelectGenre, this.selectedGenre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 60,
      child: BlocBuilder<AnimeBloc, AnimeState>(builder: (context, state) {
        if (state.isLoadingGenres) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color(0xFFF9035A),
          ));
        } else if (state.genreListFailure != null) {
          return const Center(child: Text('Error al cargar'));
        }

        final List<GenreEntity> genres = state.genres;

        return ListView.builder(
          itemCount: genres.length,
          itemBuilder: (context, index) => GenreItem(
              genre: genres[index],
              isSelected: selectedGenre?.id == genres[index].id,
              onSelectGenre: (GenreEntity genre) => onSelectGenre(genre)),
          scrollDirection: Axis.horizontal,
        );
      }),
    );
  }
}
