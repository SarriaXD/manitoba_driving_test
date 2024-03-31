import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../state/verify_email_state.dart';
import '../../view_models/verify_email_viewmodel.dart';

class VerifyEmailAnimatedPicture extends ConsumerWidget {
  const VerifyEmailAnimatedPicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyEmailViewModelProvider);
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: AnimatedSwitcher(
        duration: Durations.long1,
        child: _lottie(state),
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _lottie(VerifyEmailState state) {
    if (!state.isVerifycationStarted) {
      return Lottie.asset(
        key: const ValueKey('lottie_verify_email_not_start'),
        'assets/animations/lottie_verify_email_not_start.json',
      );
    } else if (!state.isEmailVerified) {
      return Lottie.asset(
        key: const ValueKey('lottie_verify_email_sent'),
        'assets/animations/lottie_verify_email_sent.json',
      );
    } else {
      return Lottie.asset(
        key: const ValueKey('lottie_verify_email_success'),
        'assets/animations/lottie_verify_email_success.json',
      );
    }
  }
}
