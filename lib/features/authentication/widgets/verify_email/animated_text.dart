import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/verify_email_state.dart';
import '../../view_models/verify_email_viewmodel.dart';

class VerifyEmailAnimatedText extends ConsumerWidget {
  const VerifyEmailAnimatedText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyEmailViewModelProvider);

    return Column(
      children: [
        _title(state, context),
        _subtitle(state, context),
      ],
    );
  }

  Widget _title(VerifyEmailState state, BuildContext context) {
    final username = FirebaseAuth.instance.currentUser!.displayName;
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        );
    const duration = Duration(milliseconds: 1000);
    final String titile;
    if (!state.isVerifycationStarted) {
      titile = 'Hi, $username';
    } else if (!state.isEmailVerified) {
      titile = 'Verify your email';
    } else {
      titile = 'Congratulations!, \n $username!';
    }
    return _AnimatedText(
      key: ValueKey(titile),
      text: titile,
      textStyle: textStyle,
      duration: duration,
    );
  }

  Widget _subtitle(VerifyEmailState state, BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser!.email;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.8),
          fontSize: 16,
        );
    const duration = Duration(milliseconds: 1200);
    final String subtitle;
    if (!state.isVerifycationStarted) {
      subtitle = 'We need to verify your email to continue. \n $userEmail';
    } else if (!state.isEmailVerified) {
      subtitle = 'We have sent a verification email to your email address.';
    } else {
      subtitle = 'Your email has been verified,\n enjoy your journey!';
    }

    return _AnimatedText(
      key: ValueKey(subtitle),
      text: subtitle,
      textStyle: textStyle,
      duration: duration,
    );
  }
}

class _AnimatedText extends StatefulWidget {
  const _AnimatedText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.duration,
  });
  final String text;
  final TextStyle? textStyle;
  final Duration duration;

  @override
  State<_AnimatedText> createState() => __AnimatedTextState();
}

class __AnimatedTextState extends State<_AnimatedText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, 120 * (1 - _animation.value)),
      child: Opacity(
        opacity: _animation.value,
        child: Text(
          widget.text,
          style: widget.textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
