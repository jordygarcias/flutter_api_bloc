import 'package:flutter/material.dart';

extension NavExtensions on BuildContext {
  T getArgs<T>() => ModalRoute.of(this)?.settings.arguments as T;
}
