import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/filled_bottom_button.dart';
import '../../view_models/sign_up_viewmodel.dart';

class SignUpAnimatedButton extends ConsumerWidget {
  const SignUpAnimatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(signUpViewModelProvider.select((value) => value.isLoading));
    final isConditionAccepted = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.isConditionsAccepted));
    return SizedBox(
      width: double.infinity,
      child: FilledBottomButton(
        onPressed: isConditionAccepted
            ? () {
                _signUp(ref, isLoading);
                _clearFocus(context);
              }
            : null,
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
                : Container(
                    height: 32,
                    alignment: Alignment.center,
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                    ),
                  )),
      ),
    );
  }

  void _signUp(WidgetRef ref, bool isLoading) {
    if (!isLoading) {
      ref.read(signUpViewModelProvider.notifier).signUpWithEmailAndPassword();
    }
  }

  void _clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
