import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme(Brightness theme) => ThemeData(
        useMaterial3: true,
        brightness: theme,
      );
}
