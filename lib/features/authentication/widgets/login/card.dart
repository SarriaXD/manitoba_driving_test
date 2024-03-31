import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'animated_button.dart';
import 'text_field.dart';

class LoginCard extends ConsumerWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(64),
          topRight: Radius.circular(64),
        ),
        color: Theme.of(context).colorScheme.background,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 32),
            Text(
              'Welcome Back !',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 32),
            const LoginEmailTextField(),
            const SizedBox(height: 16),
            const LoginPasswordTextField(),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => {},
              child: Text('Forgot Password?',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/auth/sign_up');
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const LoginAnimatedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
