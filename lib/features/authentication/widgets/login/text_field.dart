import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/auth_textfield.dart';
import '../../view_models/login_viewmodel.dart';

class LoginEmailTextField extends ConsumerWidget {
  const LoginEmailTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(
        loginViewModelProvider.select((inputState) => inputState.emailError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(loginViewModelProvider.notifier)
          .onUserInputChanged(email: value),
      hintText: 'Input you email.',
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      errorText: emailError,
    );
  }
}

class LoginPasswordTextField extends ConsumerWidget {
  const LoginPasswordTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordError = ref.watch(loginViewModelProvider
        .select((inputState) => inputState.passwordError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(loginViewModelProvider.notifier)
          .onUserInputChanged(password: value),
      hintText: 'Input you password.',
      labelText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      errorText: passwordError,
    );
  }
}
