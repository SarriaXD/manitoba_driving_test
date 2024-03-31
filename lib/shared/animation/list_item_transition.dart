import 'package:flutter/material.dart';

class ListItemTransition extends StatelessWidget {
  const ListItemTransition({
    super.key,
    required this.curve,
    required this.animation,
    required this.axis,
    required this.child,
  });
  final Curve curve;
  final Animation<double> animation;
  final Axis axis;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: curve,
      ),
    );
    final scale = Tween<double>(
      begin: .6,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: curve,
      ),
    );
    final opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: curve,
      ),
    );
    return SizeTransition(
      axis: axis,
      sizeFactor: size,
      child: ScaleTransition(
        scale: scale,
        child: FadeTransition(
          opacity: opacity,
          child: child,
        ),
      ),
    );
  }
}
