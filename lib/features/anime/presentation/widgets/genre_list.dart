import 'package:api_call_exercise/features/anime/domain/entities/genre_entity.dart';
import 'package:api_call_exercise/features/anime/presentation/bloc/anime_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'genre_item.dart';

class GenreList extends StatelessWidget {
  final Function onSelectGenre;
  final GenreEntity? selectedGenre;

  const GenreList({Key? key, required this.onSelectGenre, this.selectedGenre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 60,
      child: BlocBuilder<AnimeBloc, AnimeState>(builder: (context, state) {
        if (state is AnimeLoadingGenres) {
          return const Center(
              child: CircularProgressIndicator(
            color: Color(0xFFF9035A),
          ));
        } else if (state is AnimeSuccessLoadingGenres) {
          final List<GenreEntity> genres = state.genres;

          return ListView.builder(
            itemCount: genres.length,
            itemBuilder: (context, index) => GenreItem(
                genre: genres[index],
                isSelected: selectedGenre?.id == genres[index].id,
                onSelectGenre: (GenreEntity genre) => onSelectGenre(genre)),
            scrollDirection: Axis.horizontal,
          );
        } else if (state is AnimeErrorLoadingGenres) {
          return const Center(child: Text('Error al cargar'));
        }

        return const SizedBox();
      }),
    );
  }
}