import 'package:flutter/cupertino.dart';

abstract class BaseNavigator<Route extends Enum> {
  abstract String id;

  @protected
  abstract Route initialRouteEnum;

  @protected
  abstract Map<Route, WidgetBuilder> routesByEnum;

  String getRoute(Route route) {
    final shortKey = route.toString().split('.').last;
    return '/$id/$shortKey';
  }

  String get initialRoute => getRoute(initialRouteEnum);

  Map<String, WidgetBuilder> get routes =>
      routesByEnum.map((key, value) => MapEntry(getRoute(key), value));

  Future pushNamed(BuildContext context, Route route, {Object? arguments}) =>
      Navigator.of(context).pushNamed(getRoute(route), arguments: arguments);
}
