import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/login_viewmodel.dart';

class LoginAnimatedButton extends ConsumerWidget {
  const LoginAnimatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(loginViewModelProvider.select((value) => value.isLoading));
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        padding: const EdgeInsets.all(12),
      ),
      onPressed: isLoading
          ? () {}
          : () {
              ref
                  .read(loginViewModelProvider.notifier)
                  .signInWithEmailAndPassword();
              _clearFocus(context);
            },
      child: AnimatedSwitcher(
        duration: Durations.medium1,
        child: isLoading
            ? SizedBox(
                height: 32,
                width: 32,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              )
            : const Icon(
                Icons.arrow_forward_ios,
                size: 32,
              ),
      ),
    );
  }

  void _clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
