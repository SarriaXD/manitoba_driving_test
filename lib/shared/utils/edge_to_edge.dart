import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension EdgeToEdget on BuildContext {
  void enableEdgetToEdget() {
    final platformBrightness = switch (MediaQuery.platformBrightnessOf(this)) {
      Brightness.dark => Brightness.light,
      Brightness.light => Brightness.dark,
    };
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: platformBrightness,
      systemNavigationBarIconBrightness: platformBrightness,
    ));
  }
}
