// Repeat with pause.
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class QuizResultLottieAnimation extends HookWidget {
  const QuizResultLottieAnimation({super.key, required this.path});
  final String path;

  AnimationController _useAnimationController(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    useEffect(() {
      animationController.forward();
      void listener() async {
        if (animationController.isCompleted) {
          await Future.delayed(const Duration(seconds: 3));
          if (context.mounted) {
            animationController
              ..reset()
              ..forward();
          }
        }
      }

      animationController.addListener(listener);
      return () {
        animationController.removeListener(listener);
      };
    }, []);
    return animationController;
  }

  @override
  Widget build(BuildContext context) {
    final controller = _useAnimationController(context);
    return SizedBox(
      height: 250,
      child: OverflowBox(
        maxHeight: 300,
        alignment: Alignment.bottomCenter,
        child: Lottie.asset(
          path,
          controller: controller,
        ),
      ),
    );
  }
}
