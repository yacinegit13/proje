import 'package:flutter/material.dart';

class ThemeNotifier extends ValueNotifier<bool> {
  ThemeNotifier() : super(false); // false = clair, true = sombre

  void toggleTheme() => value = !value;
}
