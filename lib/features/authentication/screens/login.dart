import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../view_models/login_viewmodel.dart';
import '../widgets/login/background.dart';
import '../widgets/login/card.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _listenEvent(ref, context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const Column(
            children: [
              Expanded(
                flex: 10,
                child: LoginBackground(),
              ),
              Expanded(
                flex: 20,
                child: LoginCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _listenEvent(WidgetRef ref, BuildContext context) {
    ref.listen(loginViewModelProvider, (pre, next) {
      if (pre?.navigateToDashboard != next.navigateToDashboard &&
          next.navigateToDashboard) {
        if (next.navigateToDashboard) {
          context.go('/');
          ref
              .read(loginViewModelProvider.notifier)
              .consumeEvent(navigateToDashboardConsumed: true);
        }
      }
      if (pre?.loginError != next.loginError && next.loginError != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.loginError!),
          ),
        );
        ref
            .read(loginViewModelProvider.notifier)
            .consumeEvent(loginErrorConsumed: true);
      }
    });
  }
}
