import 'package:flutter/material.dart';

class CustomAddCurve extends Curve {
  const CustomAddCurve({
    required this.heroDuration,
    required this.addDuration,
    required this.expectedCurve,
  });
  final int heroDuration;
  final int addDuration;
  final Curve expectedCurve;

  @override
  double transformInternal(double t) {
    if (t <= heroDuration / addDuration) {
      return 0;
    } else {
      final newT = (t - (heroDuration / addDuration)) /
          (1 - (heroDuration / addDuration));
      return expectedCurve.transformInternal(newT);
    }
  }
}

class CustomRemoveCurve extends Curve {
  const CustomRemoveCurve({
    required this.heroDuration,
    required this.removeDuration,
    required this.expectedCurve,
  });
  final int heroDuration;
  final int removeDuration;
  final Curve expectedCurve;

  @override
  double transformInternal(double t) {
    if (t >= (removeDuration - heroDuration) / removeDuration) {
      return 1;
    } else {
      final newT = (t * removeDuration) / (removeDuration - heroDuration);
      return expectedCurve.transformInternal(newT);
    }
  }
}
