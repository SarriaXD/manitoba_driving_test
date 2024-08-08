import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../state/verify_email_state.dart';
import '../../view_models/verify_email_viewmodel.dart';

class VerifyEmailAnimatedButton extends ConsumerWidget {
  const VerifyEmailAnimatedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyEmailViewModelProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: _AutoDisableButton(
            isEmailVerified: state.isEmailVerified,
            onPressed: () => _onPressed(ref, state, context),
            child: AnimatedSize(
              duration: Durations.medium1,
              child: _icon(state),
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon(VerifyEmailState state) {
    Widget icon;
    if (!state.isVerifycationStarted) {
      icon = const Icon(
        key: ValueKey('email_not_start'),
        Icons.send_to_mobile,
      );
    } else if (!state.isEmailVerified) {
      icon = const Text(
        key: ValueKey('email_sent'),
        'Resend email',
      );
    } else {
      icon = const SizedBox(
        key: ValueKey('email_verified'),
        width: double.infinity,
        child: Text(
          'Start Your Journey',
          textAlign: TextAlign.center,
        ),
      );
    }
    return AnimatedSwitcher(
      duration: Durations.medium1,
      child: icon,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  void _onPressed(WidgetRef ref, VerifyEmailState state, BuildContext context) {
    if (state.isEmailVerified) {
      context.go('/');
      return;
    } else {
      ref.read(verifyEmailViewModelProvider.notifier).sendEmail();
    }
  }
}

class _AutoDisableButton extends HookWidget {
  const _AutoDisableButton({
    required this.onPressed,
    required this.child,
    required this.isEmailVerified,
  });

  final void Function() onPressed;
  final Widget child;
  final bool isEmailVerified;

  void _startTimer(
      ValueNotifier<Timer?> timer, ValueNotifier<bool> isButtonVisible) {
    timer.value?.cancel();
    isButtonVisible.value = false;
    timer.value = Timer(20.seconds, () {
      isButtonVisible.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final timer = useState<Timer?>(null);
    final isButtonVisible = useState(true);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: isButtonVisible.value || isEmailVerified
          ? () {
              onPressed();
              _startTimer(timer, isButtonVisible);
            }
          : null,
      child: child,
    );
  }
}
