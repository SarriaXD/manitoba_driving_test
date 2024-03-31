import 'package:flutter/material.dart';

extension ColorSchemeX on ColorScheme {
  Color get customGreenColor {
    if (brightness == Brightness.dark) {
      return const Color(0xff4ab8c4);
    } else {
      return const Color(0xff01aeb7);
    }
  }
}
