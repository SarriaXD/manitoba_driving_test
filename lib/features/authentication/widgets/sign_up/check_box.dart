import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_models/sign_up_viewmodel.dart';

class SignUpCheckBox extends ConsumerWidget {
  const SignUpCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAccepted = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.isConditionsAccepted));
    return SizedBox(
      height: 24,
      width: 24,
      child: Checkbox(
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary.withOpacity(.6),
          width: 2,
        ),
        value: isAccepted,
        onChanged: (value) {
          ref
              .read(signUpViewModelProvider.notifier)
              .onConditionsAcceptedChanged(value!);
        },
        activeColor: Theme.of(context).colorScheme.secondary,
        checkColor: Theme.of(context).colorScheme.onSecondary.withOpacity(.6),
      ),
    );
  }
}
