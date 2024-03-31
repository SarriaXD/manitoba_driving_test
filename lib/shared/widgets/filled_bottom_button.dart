import 'package:flutter/material.dart';

class FilledBottomButton extends StatelessWidget {
  const FilledBottomButton({
    super.key,
    this.onPressed,
    required this.child,
  });
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
