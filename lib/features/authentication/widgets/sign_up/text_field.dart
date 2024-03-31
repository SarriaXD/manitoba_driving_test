import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/widgets/auth_textfield.dart';
import '../../view_models/sign_up_viewmodel.dart';

class SignUpFirstNameTextField extends ConsumerWidget {
  const SignUpFirstNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameError = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.firstNameError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(signUpViewModelProvider.notifier)
          .onUserInputChanged(firstName: value),
      hintText: 'Input you first name.',
      labelText: 'First Name',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      errorText: firstNameError,
    );
  }
}

class SignUpLastNameTextField extends ConsumerWidget {
  const SignUpLastNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastNameError = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.lastNameError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(signUpViewModelProvider.notifier)
          .onUserInputChanged(lastName: value),
      hintText: 'Input you last name.',
      labelText: 'Last Name',
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      errorText: lastNameError,
    );
  }
}

class SignUpEmailTextField extends ConsumerWidget {
  const SignUpEmailTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(
        signUpViewModelProvider.select((inputState) => inputState.emailError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(signUpViewModelProvider.notifier)
          .onUserInputChanged(email: value),
      hintText: 'Input you email.',
      labelText: 'Email',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      errorText: emailError,
    );
  }
}

class SignUpPasswordTextField extends ConsumerWidget {
  const SignUpPasswordTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordError = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.passwordError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(signUpViewModelProvider.notifier)
          .onUserInputChanged(password: value),
      hintText: 'Input you password.',
      labelText: 'Password',
      // keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      obscureText: true,
      errorText: passwordError,
    );
  }
}

class SignUpConfirmPasswordTextField extends ConsumerWidget {
  const SignUpConfirmPasswordTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final confirmPasswordError = ref.watch(signUpViewModelProvider
        .select((inputState) => inputState.confirmPasswordError));
    return AuthTextField(
      onChanged: (value) => ref
          .read(signUpViewModelProvider.notifier)
          .onUserInputChanged(confirmPassword: value),
      hintText: 'Input you password again.',
      labelText: 'Confirm Password',
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      errorText: confirmPasswordError,
    );
  }
}
