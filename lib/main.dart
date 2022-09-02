import 'package:api_call_exercise/di/app_di.dart' as di;
import 'package:flutter/material.dart';

import 'app_navigator.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Call Exercise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xFFFFC500),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF195198),
          )),
      initialRoute: AppNavigator.initialRoute,
      routes: AppNavigator.routes,
    );
  }
}
