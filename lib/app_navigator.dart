import 'package:anime/navigation/anime_navigator.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static final initialRoute = AnimeNavigator.instance.initialRoute;
  static Map<String, WidgetBuilder> get routes => {
        ...AnimeNavigator.instance.routes,
      };
}
