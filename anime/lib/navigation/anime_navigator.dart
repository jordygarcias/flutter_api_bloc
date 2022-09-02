import 'package:anime/presentation/anime_details/view/anime_detail_view.dart';
import 'package:anime/presentation/anime_list/views/anime_view.dart';
import 'package:core/navigation/base_navigator.dart';
import 'package:core/navigation/nav_extensions.dart';
import 'package:flutter/widgets.dart';

import '../domain/entities/anime_entity.dart';
import 'anime_details_args.dart';

enum AnimeRoutes { home, details }

class AnimeNavigator extends BaseNavigator<AnimeRoutes> {
  AnimeNavigator._();

  static final instance = AnimeNavigator._();

  @override
  String id = 'anime';

  @override
  AnimeRoutes initialRouteEnum = AnimeRoutes.home;

  @override
  Map<AnimeRoutes, WidgetBuilder> routesByEnum = {
    AnimeRoutes.home: (_) => const AnimeView(),
    AnimeRoutes.details: (context) => AnimeDetailView(args: context.getArgs()),
  };

  //  Navigate to routes

  static Future navigateToHome({
    required BuildContext context,
  }) =>
      instance.pushNamed(context, AnimeRoutes.home);

  static Future navigateToDetails({
    required BuildContext context,
    required AnimeEntity anime,
  }) =>
      instance.pushNamed(
        context,
        AnimeRoutes.details,
        arguments: AnimeDetailArgs(anime: anime),
      );
}
