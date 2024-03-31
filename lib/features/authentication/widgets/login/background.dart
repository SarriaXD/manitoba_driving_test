import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

class LoginBackground extends HookWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    useEffect(() {
      controller.forward();
      return null;
    }, []);
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: 1.4,
          child: Lottie.asset(
            'assets/animations/lottie_login_background_2.json',
            fit: BoxFit.fitWidth,
          ),
        ),
        Transform.scale(
          scale: 1.2,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: FadeTransition(
              opacity:
                  CurvedAnimation(parent: controller, curve: Curves.easeIn),
              child: Lottie.asset(
                'assets/animations/lottie_login_background.json',
                reverse: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
