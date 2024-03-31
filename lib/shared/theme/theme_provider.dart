import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/provider/user_settings_provider.dart';

final themeProvider = Provider<ThemeData>(
  (ref) {
    final settings = ref.watch(userSettingsProvider);
    final brightness =
        settings.systemSettings.isDarkMode ? Brightness.dark : Brightness.light;
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Color(settings.systemSettings.themeColor),
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: colorScheme,
      brightness: brightness,
      textTheme: const TextTheme(),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashFactory: InkRipple.splashFactory,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  },
);
