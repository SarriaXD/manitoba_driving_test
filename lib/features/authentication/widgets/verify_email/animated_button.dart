import 'dart:async';

import 'package:flutter/material.dart';
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

class _AutoDisableButton extends StatefulWidget {
  const _AutoDisableButton({
    required this.onPressed,
    required this.child,
    required this.isEmailVerified,
  });
  final void Function() onPressed;
  final Widget child;
  final bool isEmailVerified;

  @override
  State<_AutoDisableButton> createState() => __AutoDisableButtonState();
}

class __AutoDisableButtonState extends State<_AutoDisableButton> {
  bool _isButtonDisabled = false;
  final _seconds = 20;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isButtonDisabled = true;
    });
    _timer = Timer(Duration(seconds: _seconds), () {
      if (mounted) {
        setState(() {
          _isButtonDisabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(12),
      ),
      onPressed: _isButtonDisabled && !widget.isEmailVerified
          ? null
          : () {
              widget.onPressed();
              _startTimer();
            },
      child: widget.child,
    );
  }
}
