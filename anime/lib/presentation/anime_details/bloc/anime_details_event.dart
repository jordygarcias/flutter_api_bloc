part of 'anime_details_bloc.dart';

abstract class AnimeDetailsEvent {}

class AnimeDetailsStarted extends AnimeDetailsEvent {
  final AnimeEntity anime;

  AnimeDetailsStarted({required this.anime});
}
