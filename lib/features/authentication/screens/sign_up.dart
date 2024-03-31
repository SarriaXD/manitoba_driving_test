import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../view_models/sign_up_viewmodel.dart';
import '../widgets/sign_up/animated_button.dart';
import '../widgets/sign_up/check_box.dart';
import '../widgets/sign_up/condition.dart';
import '../widgets/sign_up/text_field.dart';
import '../widgets/sign_up/title.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenEvent(context, ref);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignUpTitle(),
                  const SizedBox(height: 16),
                  Text(
                      'Create a new account to save your test results and history',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(.6),
                          )),
                  const SizedBox(height: 16),
                  const SignUpFirstNameTextField(),
                  const SizedBox(height: 16),
                  const SignUpLastNameTextField(),
                  const SizedBox(height: 16),
                  const SignUpEmailTextField(),
                  const SizedBox(height: 16),
                  const SignUpPasswordTextField(),
                  const SizedBox(height: 16),
                  const SignUpConfirmPasswordTextField(),
                  const SizedBox(height: 16),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SignUpCheckBox(),
                      SizedBox(width: 8),
                      Expanded(child: SignUpCondition()),
                    ],
                  ),
                  const SizedBox(height: 64),
                  const SignUpAnimatedButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _listenEvent(BuildContext context, WidgetRef ref) {
    ref.listen(signUpViewModelProvider, (previous, next) {
      if (previous?.navigateToVerifyEmail == false &&
          next.navigateToVerifyEmail == true) {
        context.go('/auth/verify_email');
        ref
            .read(signUpViewModelProvider.notifier)
            .consumeEvent(navigateToVeryEmailConsumed: true);
      }
      if (previous?.signUpError == null && next.signUpError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.signUpError!),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
        ref
            .read(signUpViewModelProvider.notifier)
            .consumeEvent(signUpErrorConsumed: true);
      }
    });
  }
}
