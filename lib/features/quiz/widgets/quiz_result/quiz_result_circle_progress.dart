import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:manitoba_driving_test/shared/theme/colors.dart';

class QuizResultCircleProgress extends StatelessWidget {
  const QuizResultCircleProgress({
    super.key,
    required this.correctSize,
    required this.totalSize,
  });
  final int correctSize;
  final int totalSize;
  final size = 100.0;
  double get _progress => correctSize / totalSize;

  @override
  Widget build(BuildContext context) {
    final badColor = Theme.of(context).colorScheme.error.withOpacity(.7);
    return Builder(builder: (context) {
      final goodColor = Theme.of(context).colorScheme.customGreenColor;
      final color = correctSize / totalSize >= 0.8 ? goodColor : badColor;
      final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: color,
            letterSpacing: 4,
          );
      return Animate().custom(
        delay: Durations.extralong4,
        duration: Durations.extralong4,
        curve: Curves.easeOutCubic,
        begin: 0,
        end: _progress,
        builder: (_, value, __) => CustomPaint(
          size: Size(size, size),
          painter: _QuizCircleProgressPainter(
            progress: value,
            correctSize: correctSize,
            totalSize: totalSize,
            textStyle: textStyle,
            color: color,
            circleBackgroundColor:
                Theme.of(context).colorScheme.onBackground.withOpacity(.2),
          ),
        ),
      );
    });
  }
}

class _QuizCircleProgressPainter extends CustomPainter {
  final double progress;
  final int correctSize;
  final int totalSize;
  final double lineWidth = 6;
  final TextStyle? textStyle;
  final Color color;
  final Color circleBackgroundColor;

  _QuizCircleProgressPainter({
    required this.progress,
    required this.correctSize,
    required this.totalSize,
    required this.textStyle,
    required this.circleBackgroundColor,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double sideLength = size.width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = sideLength / 2 - lineWidth;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);

    Paint grayPaint = Paint()
      ..color = circleBackgroundColor
      ..strokeWidth = lineWidth * 0.65
      ..style = PaintingStyle.stroke;

    Paint progressPaint = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, grayPaint);

    double angle = 0.96 * 2 * math.pi * progress;
    canvas.drawArc(
      rect,
      -math.pi / 2,
      angle,
      false,
      progressPaint,
    );

    // format to xx%
    TextSpan span = TextSpan(
      text: '${(progress * 100).toInt()}',
      style: textStyle,
      children: [
        TextSpan(
          text: '%',
          style: textStyle?.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: color.withOpacity(.8),
          ),
        ),
      ],
    );
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
      canvas,
      center - Offset(tp.width / 2, tp.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
