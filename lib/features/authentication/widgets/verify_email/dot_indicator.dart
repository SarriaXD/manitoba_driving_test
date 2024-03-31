import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../view_models/verify_email_viewmodel.dart';

class VerifyEmailDotIndicator extends ConsumerStatefulWidget {
  const VerifyEmailDotIndicator({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailDotIndicatorState();
}

class _VerifyEmailDotIndicatorState
    extends ConsumerState<VerifyEmailDotIndicator> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: _currentPage,
      count: 3,
      effect: ExpandingDotsEffect(
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotColor: Theme.of(context).colorScheme.primary.withOpacity(.3),
      ),
    );
  }

  int get _currentPage {
    final state = ref.watch(verifyEmailViewModelProvider);
    if (!state.isVerifycationStarted) {
      return 0;
    }
    if (!state.isEmailVerified) {
      return 1;
    }
    return 2;
  }
}
