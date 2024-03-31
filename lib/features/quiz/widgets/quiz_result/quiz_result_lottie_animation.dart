// Repeat with pause.
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class QuizResultLottieAnimation extends StatefulWidget {
  const QuizResultLottieAnimation({super.key, required this.path});
  final String path;

  @override
  State<QuizResultLottieAnimation> createState() =>
      _QuizResultLottieAnimationState();
}

class _QuizResultLottieAnimationState extends State<QuizResultLottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    _animationController.addListener(() async {
      if (_animationController.isCompleted) {
        await Future.delayed(const Duration(seconds: 3));
        if (mounted) {
          _animationController
            ..reset()
            ..forward();
        }
      }
    });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: OverflowBox(
        maxHeight: 300,
        alignment: Alignment.bottomCenter,
        child: Lottie.asset(
          widget.path,
          controller: _animationController,
        ),
      ),
    );
  }
}
